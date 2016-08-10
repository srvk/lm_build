#!/bin/bash

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# THIS CODE IS PROVIDED *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY IMPLIED
# WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR PURPOSE,
# MERCHANTABLITY OR NON-INFRINGEMENT.
# See the Apache 2 License for the specific language governing permissions and
# limitations under the License.

# This script constructs a new phoneme-based lexicon based on a supplied dictionary
# file (defaults to TEDLIUM.152k.dic), a list of "new words" to add to the dict (newwords.txt)
# and a training text (example_txt)
# Then it compiles a new ARPA language model and graph based on the dict and training text.
# It then composes the resulting Language, Grammar, and Token graphs into a new
# decoding graph suitable for use decoding speech with eesen-transcriber

# * Method 1: manually create a file newwords.txt in the lm_build working folder, 
#   into which you place new words (not already in the lexicon in TEDLIUM.152k.dic)
#   Pronunciations will be automatically generated and added to the dictionary.
# * Method 2: Automatic candidate OOV words are generated when you run run_adapt.sh in the
#   file candidate_oovs.txt. This candidate list of new words contains all words found in
#   the training text not already in the dictionary (OOV words) that appear more than once. 
#   Rename this file newwords.txt and run run_adapt.sh again to use all these words with a
#   frequency greater than 2. Or edit newwords.txt having a look at oov-counts.txt to see
#   the word frequency counts and help you iteratively refine the dictionary
# * (optionally) add to the example_txt training text file some examples that use the new words
#   Hint: you may need to repeat these LM adaptation sentences between 50 and 100 times for the
#   transcriber to recognize and produce them as output.
# * Run the script run_adapt.sh. This will do several things, but the end result will be a new
#   composed decoding graph TLG.fst in the output folder data/lang_phn_test/

# required input: example_txt
# optional input: newwords.txt

#dict=../db/cantab-TEDLIUM/cantab-TEDLIUM.dct
dict=TEDLIUM.152k.dic
lm_folder=adapt_lm
langdir=data/lang_phn
train_txt=example_txt

# Generate pronunciations for words in supplied text file "newwords.txt"

# Get pronunciations from CMU lex tool (requires internet connectivity!)
# the last bit fixes case: downcase word, leave phonemes upcased
echo "Looking up pronunciations for new words"
if [ -f newwords.txt ]; then
  curl -s `curl -s -F "wordfile=@newwords.txt" http://www.speech.cs.cmu.edu/cgi-bin/tools/logios/lextool.pl | awk ' /DICT/ { print $3 } '` | awk '{printf tolower($1 " "); for (i=2; i<=NF; i++)  
   printf ($i " "); print ""}' > newwords.dct
  cat newwords.dct $dict | sed 's/(.)//g' | sort > newdict.dct
else
  cp $dict newdict.dct
fi

# Construct the phoneme-based lexicon, output in data/local/dict_phn
echo "Constructing the phoneme-based lexicon"
utils/prepare_phn_dict.sh --srcdict newdict.dct || exit 1;

# Compile the lexicon and token FSTs
echo "Compiling the lexicon and token FSTs"
../utils/ctc_compile_dict_token.sh data/local/dict_phn data/local/${langdir}_tmp $langdir || exit 1;

# build our own ARPA LM from user provided (or default) training text
# train_lms.sh takes lang_bd/words.txt and wordlist.txt as input; create anew from dictionary
# creates output file adapt_lm/3gram-mincount/lm_pr6.0.gz

cat newdict.dct | awk '{print $1}' | sort | uniq > wordlist.txt

# pop out OOVs list from training text
echo "Generating candidate_oovs.txt"
cat $train_txt | awk -v w=wordlist.txt \
  'BEGIN{while((getline<w)>0) v[$1]=1;} {for (i=1;i<=NF;i++) if ($i in v); else printf $i;print ""}' \
  | sed '/^$/d' | grep -v -e '[[:digit:]]' | grep -v -e '[[:punct:]]' | grep -e '[[:alnum:]]' | sort | uniq -c | sort -rn > oov-counts.txt
# append words with >2 frequency to wordlist
grep -v "      1" oov-counts.txt | awk '{print $2}' > candidate_oovs.txt

# lingering data corrupts output, so clear first
rm -rf $lm_folder
. path.sh
train_lms.sh $train_txt $lm_folder

# Compose the decoding graph but use the just-built ARPA LM
echo "Finding OOV words in ARPA LM but not in our words.txt"
arpa_lm=$lm_folder/3gram-mincount/lm_pr6.0.gz
oov_list=$langdir/oovs.txt

gunzip -c $arpa_lm | utils/find_arpa_oovs.pl $langdir/words.txt > $oov_list || exit 1;

echo "Composing the decoding graph using our own ARPA LM"
../local/tedlium_decode_graph.sh --arpa_lm $arpa_lm --oov_list $oov_list $langdir || exit 1;

echo "Finished adapting LM, results in " `pwd`/${langdir}_test
