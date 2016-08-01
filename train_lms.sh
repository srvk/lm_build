#!/bin/bash

# This script trains LMs.

if [ $# -ne 2 ]; then
  echo "Usage: ./train_lms.sh example_txt local_lm"
  echo "  where example_text is sentences one per line training text"
  echo "  and local_lm is the output folder into which LM gets placed"
  exit 1;
fi

train_txt=$1
dir=$2

mkdir -p $dir
. ./path.sh || exit 1; # for KALDI_ROOT
export PATH=$KALDI_ROOT/tools/kaldi_lm:$PATH
( # First make sure the kaldi_lm toolkit is installed.
 cd $KALDI_ROOT/tools || exit 1;
 if [ -d kaldi_lm ]; then
   echo Not installing the kaldi_lm toolkit since it is already there.
 else
   echo Downloading and installing the kaldi_lm tools
   if [ ! -f kaldi_lm.tar.gz ]; then
     wget http://www.danielpovey.com/files/kaldi/kaldi_lm.tar.gz || exit 1;
   fi
   tar -xvzf kaldi_lm.tar.gz || exit 1;
   cd kaldi_lm
   make || exit 1;
   echo Done making the kaldi_lm tools
 fi
) || exit 1;

# Training data with OOV words replaced with <UNK>.
cat $train_txt | awk -v w=wordlist.txt \
  'BEGIN{while((getline<w)>0) v[$1]=1;} {for (i=1;i<=NF;i++) if ($i in v) printf $i" ";else printf "<UNK> ";print ""}'|sed 's/ $//g' \
  | gzip -c > $dir/train_nounk.gz

# count word frequencies of no-unknowns training text concatenated
# with wordlist.txt so each word appears at least once in unigram.counts
gunzip -c $dir/train_nounk.gz | cat - wordlist.txt | \
  awk '{ for(x=1;x<=NF;x++) count[$x]++; } END{for(w in count){print count[w], w;}}' | \
 sort -nr > $dir/unigram.counts

# Get "mapped" words
cat $dir/unigram.counts  | awk '{print $2}' | get_word_map.pl "<s>" "</s>" "<UNK>" > $dir/word_map

gunzip -c $dir/train_nounk.gz | awk -v wmap=$dir/word_map 'BEGIN{while((getline<wmap)>0)map[$1]=$2;}
  { for(n=1;n<=NF;n++) { printf map[$n]; if(n<NF){ printf " "; } else { print ""; }}}' | gzip -c >$dir/train.gz
# Different format than train_nounk.gz, train.gz replaces each
# word in train text with the corresponding symbol from word_map

#rm $dir/train_nounk.gz 

# Now train and prune the LM. Her we go.
train_lm.sh --arpa --lmtype 3gram-mincount $dir
prune_lm.sh --arpa 6.0 $dir/3gram-mincount/

# This will be done later

# Format the generated LM
#echo "Done with LM building. Now formatting LM to FST ..."
#cp -r lang_bd $dir/lang_test_bd_tgpr

#gunzip -c $dir/3gram-mincount/lm_pr6.0.gz | arpa2fst - | fstprint | \
#    utils/eps2disambig.pl | utils/s2eps.pl | fstcompile --isymbols=lang_bd/words.txt \
#    --osymbols=lang_bd/words.txt  --keep_isymbols=false --keep_osymbols=false | \
#    fstrmepsilon > $dir/lang_test_bd_tgpr/G.fst || exit 1;

#fstisstochastic $dir/lang_test_bd_tgpr/G.fst

exit 0

