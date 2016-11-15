#!/bin/bash

# Copyright 2016  Yajie Miao, Eric Riebling
# Apache 2.0

# Create a token-based decoding graph from a sample text and words.txt
# Takes one argument: name of the text
# Takes one optional argument, name of langdir where words.txt is found
# Output is in folder tinylm/

oov_word="<unk>"   # the oov word, used to convert oov words in the transcripts

langdir=../data/lang_phn_test_test_newlm
## End configuration section

echo "$0 $@"  # Print the command line for logging

[ -f ./path.sh ] && . ./path.sh;
. parse_options.sh || exit 1;

if [ $# != 1 ]; then
   echo "Wrong #arguments ($#, expected 1)"
   echo "Usage: make_tinylm_graph.sh [--langdir langdir] example_txt"
   exit 1;
fi

dir=tinylm
mkdir -p $dir

# Check if necessary files exist.
for f in $1; do
  [ ! -f $f ] && echo "$0: no such file $f" && exit 1;
done

## Create the decoding graph
oov_int=`grep $oov_word $langdir/words.txt | awk '{print $2}'`

utils/sym2int.pl --map-oov $oov_int -f 2- $langdir/words.txt $1 > $dir/text_int 

./training_trans_fst.py $dir/text_int | fstcompile | fstarcsort --sort_type=olabel > $dir/G.fst

fsttablecompose ${langdir}/L.fst $dir/G.fst | fstdeterminizestar --use-log=true | \
	fstminimizeencoded | fstarcsort --sort_type=ilabel > $dir/LG.fst || exit 1;

fsttablecompose ${langdir}/T.fst $dir/LG.fst > $dir/TLG.fst || exit 1;
cp ${langdir}/words.txt $dir

exit 0;
