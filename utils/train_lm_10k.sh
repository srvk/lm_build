#!/bin/bash


# This script trains an LM, using a technique closely related
# to modified, interpolated Kneser-Ney, but which performs 
# a bit better.  The LM is stored in a "Kaldi-LM" format, 
# as N-gram counts; or with the --arpa option, in the ARPA 
# format.

# The input is a directory where there should exist the following
# files, look at scripts that call this script for examples of
# how to obtain these
#  train.gz  [the training set in "mapped form"]
#  word_map [a map from the original words to the "mapped" words]

# We assume that we want to use the first n sentences of the
# training set as a validation and tuning set (they'll be used,
# for example, to estimate discounting factors).  For now
# its size is hardwired at 10k sentences.

heldout_sent=10000
write_arpa=false
cleanup=false
lmtype=3gram-mincount

# Parse options.
for n in `seq 3`; do
  if [ "$1" == "--arpa" ]; then
    write_arpa=true
    shift
  fi
  if [ "$1" == "--cleanup" ]; then
    cleanup=true
    shift
  fi
  if [ "$1" == "--lmtype" ]; then
    shift
    lmtype=$1
    shift
  fi
done

if [ $# != 1 ]; then
  echo "Usage: train_lm.sh [options] train_dir"
  echo "Options:"
  echo "  --arpa   : write arpa file as well as N-gram format"
  echo "             Note: output filenames are determined by type of LM."
  echo "  --lmtype [3gram|3gram-mincount|4gram|4gram-mincount] : type of LM to build."
fi

dir=$1

[ ! -f $dir/train.gz -o ! -f $dir/word_map ] && \
 ( echo Expecting files $dir/train.gz and $dir/word_map to exist;
   echo E.g. see egs/wsj/s3/local/wsj_train_lm.sh for examples. ) && exit 1;

# Check the path.
! merge_ngrams </dev/null >&/dev/null  && echo You need to have kaldi_lm on your path \
   && exit 1;


subdir=$dir/$lmtype
mkdir -p $subdir


if [ -s $subdir/ngrams.gz -a -s $subdir/heldout_ngrams.gz ]; then
  echo "Not creating raw N-gram counts ngrams.gz and heldout_ngrams.gz since they already exist in $subdir"
  echo "(remove them if you want them regenerated)"
else 
  echo Getting raw N-gram counts

  case $lmtype in
      3gram) gunzip -c $dir/train.gz | tail -n +$heldout_sent | \
          get_raw_ngrams 3 | sort | uniq -c | uniq_to_ngrams | \
          sort | gzip -c > $subdir/ngrams.gz    
    # Note: the Perl command below adds ":" before the count, which
    # is a marker that these N-grams are test N-grams.
    gunzip -c $dir/train.gz | head -n $heldout_sent | \
        get_raw_ngrams 3 | sort | uniq -c | uniq_to_ngrams | \
        perl -ane 's/(\S+)$/:$1/; print;' | sort | gzip -c > $subdir/heldout_ngrams.gz    
    ;; 
    3gram-mincount) 
# The following config discounts 1 from all 3-grams.
# Note: phi doesn't matter if tau=0.
    cat >$subdir/config.get_ngrams <<EOF
D=0 tau=0 phi=1
D=0 tau=0 phi=1
D=1 tau=0 phi=1
EOF
    gunzip -c $dir/train.gz | tail -n +$heldout_sent | \
     get_raw_ngrams 3 | sort | uniq -c | uniq_to_ngrams | \
     sort | discount_ngrams $subdir/config.get_ngrams | \
     sort | merge_ngrams | gzip -c > $subdir/ngrams.gz    
    gunzip -c $dir/train.gz | head -n $heldout_sent | \
        get_raw_ngrams 3 | sort | uniq -c | uniq_to_ngrams | \
        perl -ane 's/(\S+)$/:$1/; print;' | sort | gzip -c > $subdir/heldout_ngrams.gz    

    # er1k experiment
    gunzip -c $dir/train.gz | head -n $heldout_sent | \
        get_raw_ngrams 3 | sort | uniq -c | uniq_to_ngrams | \
     sort | discount_ngrams $subdir/config.get_ngrams | \
     sort | merge_ngrams | gzip -c > $subdir/unheldout_ngrams.gz    

    ;; 
    4gram) 
      gunzip -c $dir/train.gz | tail -n +$heldout_sent | \
       get_raw_ngrams 4 | sort | uniq -c | uniq_to_ngrams | \
       sort | gzip -c > $subdir/ngrams.gz    
      gunzip -c $dir/train.gz | head -n $heldout_sent | \
       get_raw_ngrams 4 | sort | uniq -c | uniq_to_ngrams | \
        perl -ane 's/(\S+)$/:$1/; print;' | sort | gzip -c > $subdir/heldout_ngrams.gz
    ;; 
    4gram-mincount) 
# The following config discounts 1 from all 3-grams and 4-grams.
# Note: phi doesn't matter if tau=0.
     cat >$subdir/config.get_ngrams <<EOF
D=0 tau=0 phi=1
D=0 tau=0 phi=1
D=1 tau=0 phi=1
D=1 tau=0 phi=1
EOF
     gunzip -c $dir/train.gz | tail -n +$heldout_sent | \
      get_raw_ngrams 4 | sort | uniq -c | uniq_to_ngrams | \
      sort | merge_ngrams | discount_ngrams $subdir/config.get_ngrams | \
      sort | merge_ngrams | gzip -c > $subdir/ngrams.gz    
     gunzip -c $dir/train.gz | head -n $heldout_sent | \
      get_raw_ngrams 4 | sort | uniq -c | uniq_to_ngrams | \
      perl -ane 's/(\S+)$/:$1/; print;' | sort | gzip -c > $subdir/heldout_ngrams.gz
     ;; 
     *)
    echo Invalid --lmtype option: $lmtype
    exit 1
    ;;
  esac
fi

[ ! -f $subdir/ngrams.gz -o ! -s $subdir/ngrams.gz ] && \
    echo "Error getting N-grams" && exit 1;


# OK-- now create the config files.  This is dependent on
# the recipe.  config.0 is the default one that we start
# optimizing with.

case $lmtype in
 3gram)
cat > $subdir/config.0 <<EOF
D=0.4 tau=0.9 phi=2.0
D=0.6 tau=0.9 phi=2.0
D=0.8 tau=1.1 phi=2.0
EOF
cat > $subdir/config.diff_1 <<EOF
D=0 tau=1 phi=0
D=0 tau=1 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_2 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=1 tau=0 phi=0
EOF
cat > $subdir/config.diff_3 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_4 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
cat > $subdir/config.diff_5 <<EOF
D=0 tau=0 phi=0
D=1 tau=0 phi=0
EOF
cat > $subdir/config.diff_6 <<EOF
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_7 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
num_configs=7
;;
3gram-mincount)
cat > $subdir/config.0 <<EOF
D=0.6 tau=0.9 phi=2
D=0.8 tau=0.9 phi=2
D=0 tau=1.1 phi=2
EOF
cat > $subdir/config.diff_1 <<EOF
D=0 tau=1 phi=0
D=0 tau=1 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_2 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_3 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
cat > $subdir/config.diff_4 <<EOF
D=0 tau=0 phi=0
D=1 tau=0 phi=0
EOF
cat > $subdir/config.diff_5 <<EOF
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_6 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
num_configs=6
;;
 4gram)
cat > $subdir/config.0 <<EOF
D=0.4 tau=0.9 phi=2
D=0.5 tau=0.9 phi=2
D=0.6 tau=0.9 phi=2
D=0.8 tau=1 phi=2
EOF
cat > $subdir/config.diff_1 <<EOF
D=0 tau=1 phi=0
D=0 tau=1 phi=0
D=0 tau=1 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_2 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=1 tau=0 phi=0
EOF
cat > $subdir/config.diff_3 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_4 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
cat > $subdir/config.diff_5 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=1 tau=0 phi=0
EOF
cat > $subdir/config.diff_6 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_7 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
cat > $subdir/config.diff_8 <<EOF
D=0 tau=0 phi=0
D=1 tau=0 phi=0
EOF
cat > $subdir/config.diff_9 <<EOF
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_10 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
num_configs=10
;;
4gram-mincount)
cat > $subdir/config.0 <<EOF
D=0.6 tau=0.9 phi=2.0
D=0.8 tau=0.9 phi=2.0
D=0.0 tau=0.9 phi=2.0
D=0.0 tau=0.9 phi=2.0
EOF
cat > $subdir/config.diff_1 <<EOF
D=0 tau=1 phi=0
D=0 tau=1 phi=0
D=0 tau=1 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_2 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_3 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
cat > $subdir/config.diff_4 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_5 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
cat > $subdir/config.diff_6 <<EOF
D=0 tau=0 phi=0
D=1 tau=0 phi=0
EOF
cat > $subdir/config.diff_7 <<EOF
D=0 tau=0 phi=0
D=0 tau=1 phi=0
EOF
cat > $subdir/config.diff_8 <<EOF
D=0 tau=0 phi=0
D=0 tau=0 phi=1
EOF
num_configs=8
;;
esac


awk '{print $2}' $dir/word_map > $dir/wordlist.mapped

# Define a subroutine
get_perplexity()  { # echoes the perplexity to stdout. uses current "$config" as config
  time gunzip -c $subdir/ngrams.gz | \
   discount_ngrams "$config" | sort | merge_ngrams | \
   interpolate_ngrams $dir/wordlist.mapped 0.5 | sort | \
   sort -m <(gunzip -c $subdir/heldout_ngrams.gz) - | compute_perplexity
}

mkdir -p $subdir/configs/ $subdir/perplexities/

if [ -f $subdir/config.$num_configs ]; then
  echo Not doing optimization of discounting parameters since
  echo file $subdir/config.$num_configs already exists
else
  for n in `seq 1 $num_configs`; do
    echo "Iteration $n/$num_configs of optimizing discounting parameters"
    for alpha in -0.25 0.0 0.35; do
      config=$subdir/configs/config.$n.$alpha
      # Note: if this ensure-nonnegative stuff gets active here it would cause
      # the optimization to give the wrong answer, but we've set up the config files
      # in such a way that this shouldn't happen.
      scale_configs.pl $subdir/config.$[$n-1] $subdir/config.diff_$n $alpha > $config
      get_perplexity > $subdir/perplexities/$n.$alpha &
    done
    wait
    optimize_alpha.pl -0.25 `cat $subdir/perplexities/$n.-0.25` \
                       0.0 `cat $subdir/perplexities/$n.0.0` \
                      0.35 `cat $subdir/perplexities/$n.0.35` > $subdir/perplexities/alpha.$n || exit 1;
    alpha=`cat $subdir/perplexities/alpha.$n`
    echo "Alpha value on iter $n is $alpha"
    scale_configs.pl $subdir/config.$[$n-1] $subdir/config.diff_$n $alpha > $subdir/config.$n
  done
fi
echo Final config is:
cat $subdir/config.$num_configs

# Create final LM as discounted (but not interpolated) N-grams:
if gunzip -c $subdir/ngrams_disc.gz >&/dev/null; then
  echo "Not creating discounted N-grams file $subdir/ngrams_disc.gz since it already exists"
else
  echo "Discounting N-grams."
  gunzip -c $subdir/ngrams.gz | \
   discount_ngrams $subdir/config.$num_configs | sort | merge_ngrams | \
   gzip -c > $subdir/ngrams_disc.gz
  gunzip -c $subdir/unheldout_ngrams.gz | \
   discount_ngrams $subdir/config.$num_configs | sort | merge_ngrams | \
   gzip -c > $subdir/heldout_ngrams_disc.gz


fi

echo "Computing final perplexity"
gunzip -c $subdir/ngrams_disc.gz | \
  interpolate_ngrams $dir/wordlist.mapped 0.5 | \
  sort | sort -m <(gunzip -c $subdir/heldout_ngrams.gz) - | \
  compute_perplexity 2>&1 | tee  $subdir/perplexity &


if $write_arpa; then
  echo "Building ARPA LM (perplexity computation is in background)"
  mkdir -p $subdir/tmpdir
  gunzip -c $subdir/ngrams_disc.gz | cat - <(gunzip -c $subdir/unheldout_ngrams_disc.gz) | \
    interpolate_ngrams --arpa $dir/wordlist.mapped 0.5 | \
    sort | finalize_arpa.pl $subdir/tmpdir | \
    map_words_in_arpa.pl $dir/word_map | \
    gzip -c > $subdir/lm_unpruned.gz
fi


wait
echo Done training LM of type $lmtype


