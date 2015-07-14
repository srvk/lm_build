```
#!

mario@Mario:/kaldi-trunk/egs/tedlium/s5/lm_build$ ./train_lms.sh example_txt local_lm
Downloading and installing the kaldi_lm tools
--2014-12-09 13:32:08--  http://www.danielpovey.com/files/kaldi/kaldi_lm.tar.gz
Resolving www.danielpovey.com (www.danielpovey.com)... 107.178.217.247
Connecting to www.danielpovey.com (www.danielpovey.com)|107.178.217.247|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 51082 (50K) [application/x-gzip]
Saving to: 'kaldi_lm.tar.gz'

100%[======================================>] 51,082      --.-K/s   in 0.09s   

2014-12-09 13:32:08 (570 KB/s) - 'kaldi_lm.tar.gz' saved [51082/51082]

kaldi_lm/
kaldi_lm/get_ngram_counts.cc
kaldi_lm/Makefile
kaldi_lm/get_raw_ngrams.cc
kaldi_lm/uniq_to_ngrams.cc
kaldi_lm/merge_ngrams_online
kaldi_lm/discount_ngrams.cc
kaldi_lm/merge_ngrams.cc
kaldi_lm/interpolate_ngrams.cc
kaldi_lm/compute_perplexity.cc
kaldi_lm/kaldi_lm.h
kaldi_lm/prune_ngrams.cc
kaldi_lm/get_word_map.pl
kaldi_lm/map_words_in_arpa.pl
kaldi_lm/finalize_arpa.pl
kaldi_lm/optimize_alpha.pl
kaldi_lm/train_lm.sh
kaldi_lm/prune_lm.sh
kaldi_lm/discount_ngrams.old.cc
kaldi_lm/scale_configs.pl
g++  -g   get_raw_ngrams.cc   -o get_raw_ngrams
g++  -g   uniq_to_ngrams.cc   -o uniq_to_ngrams
g++  -g   merge_ngrams.cc   -o merge_ngrams
g++  -g   discount_ngrams.cc kaldi_lm.h   -o discount_ngrams
g++  -g   interpolate_ngrams.cc   -o interpolate_ngrams
interpolate_ngrams.cc: In function 'void write_counts_arpa(int)':
interpolate_ngrams.cc:386:42: warning: format '%d' expects argument of type 'int', but argument 2 has type 'std::vector<Counts>::size_type {aka long unsigned int}' [-Wformat=]
     printf("00 %d\n", ngram_counts.size());
                                          ^
g++  -g   compute_perplexity.cc   -o compute_perplexity
compute_perplexity.cc: In function 'void process_test_set_ngram(int, std::string, double)':
compute_perplexity.cc:196:57: warning: format '%d' expects argument of type 'int', but argument 6 has type 'double' [-Wformat=]
               predicted.c_str(), prob, log10_prob, count);
                                                         ^
g++  -g   prune_ngrams.cc kaldi_lm.h   -o prune_ngrams
Done making the kaldi_lm tools
Getting raw N-gram counts
discount_ngrams: for n-gram order 1, D=0.000000, tau=0.000000 phi=1.000000
discount_ngrams: for n-gram order 2, D=0.000000, tau=0.000000 phi=1.000000
discount_ngrams: for n-gram order 3, D=1.000000, tau=0.000000 phi=1.000000
Iteration 1/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=0.900000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=0.900000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.100000 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=0.675000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=0.675000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=0.825000 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.215000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.215000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.485000 phi=2.000000
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
Perplexity over 182489.000000 words is 200.159285
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 203.498658

real	0m19.957s
user	0m8.409s
sys	0m4.811s
Perplexity over 182489.000000 words is 199.905343
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 203.289843

real	0m20.665s
user	0m8.465s
sys	0m4.663s
Perplexity over 182489.000000 words is 200.396265
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 203.698194

real	0m20.996s
user	0m8.321s
sys	0m4.722s
optimize_alpha.pl: alpha=1.15383335474818 is too positive, limiting it to 0.7
Projected perplexity change from setting alpha=0.7 is 200.159285->199.742202666667, reduction of 0.417082333333468
Alpha value on iter 1 is 0.7
Iteration 2/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.402500 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.524500 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.870000 phi=2.000000
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
Perplexity over 182489.000000 words is 200.098400
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 203.535281

real	0m19.151s
user	0m8.369s
sys	0m4.326s
Perplexity over 182489.000000 words is 199.877856
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 203.305438

real	0m19.986s
user	0m8.380s
sys	0m4.616s
Perplexity over 182489.000000 words is 199.690535
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 203.109321

real	0m20.585s
user	0m8.713s
sys	0m4.503s
Projected perplexity change from setting alpha=0.637747219628424 is 199.877856->199.64265359546, reduction of 0.235202404540019
Alpha value on iter 2 is 0.637747219628424
Iteration 3/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.750000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=2.350000
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
Perplexity over 182489.000000 words is 199.602925
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 203.016380

real	0m19.965s
user	0m8.506s
sys	0m4.706s
Perplexity over 182489.000000 words is 199.698261
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 203.117231

real	0m20.342s
user	0m8.335s
sys	0m4.579s
Perplexity over 182489.000000 words is 199.573319
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.983046

real	0m20.708s
user	0m8.537s
sys	0m4.544s
Projected perplexity change from setting alpha=-0.355749189052868 is 199.602925->199.57044938497, reduction of 0.0324756150298242
Alpha value on iter 3 is -0.355749189052868
Iteration 4/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=1.080000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
Perplexity over 182489.000000 words is 207.709004
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 211.351021

real	0m22.247s
user	0m6.592s
sys	0m3.229s
Perplexity over 182489.000000 words is 199.092218
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.468505

real	0m28.182s
user	0m8.921s
sys	0m5.186s
Perplexity over 182489.000000 words is 199.578970
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.987461

real	0m28.962s
user	0m8.541s
sys	0m5.583s
Projected perplexity change from setting alpha=-0.152446279299472 is 199.578970->198.754665026603, reduction of 0.824304973397432
Alpha value on iter 4 is -0.152446279299472
Iteration 5/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.678043, tau=1.147500 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.678043, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.678043, tau=2.065500 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
Perplexity over 182489.000000 words is 198.951693
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.327730

real	0m23.342s
user	0m8.254s
sys	0m5.423s
Perplexity over 182489.000000 words is 198.887861
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.266274

real	0m24.801s
user	0m8.768s
sys	0m5.046s
Perplexity over 182489.000000 words is 198.957912
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.344502

real	0m25.554s
user	0m8.777s
sys	0m5.061s
Projected perplexity change from setting alpha=0.0431730418189247 is 198.887861->198.886446062146, reduction of 0.00141493785363878
Alpha value on iter 5 is 0.0431730418189247
Iteration 6/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.678043, tau=1.596055 phi=1.750000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.678043, tau=1.596055 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.678043, tau=1.596055 phi=2.350000
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
Perplexity over 182489.000000 words is 198.869381
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.243283

real	0m19.547s
user	0m8.087s
sys	0m4.683s
Perplexity over 182489.000000 words is 198.992203
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.378080

real	0m19.965s
user	0m8.752s
sys	0m4.069s
Perplexity over 182489.000000 words is 198.887312
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.266400

real	0m20.560s
user	0m8.442s
sys	0m4.440s
Projected perplexity change from setting alpha=0.216727041710757 is 198.887312->198.858477323688, reduction of 0.0288346763117886
Alpha value on iter 6 is 0.216727041710757
Final config is:
D=0.6 tau=1.53 phi=2
D=0.678042976560422 tau=1.59605475398295 phi=2.21672704171076
D=0 tau=3.06258730070515 phi=1.64425081094713
Discounting N-grams.
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.530000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.678043, tau=1.596055 phi=2.216727
discount_ngrams: for n-gram order 3, D=0.000000, tau=3.062587 phi=1.644251
Computing final perplexity
Building ARPA LM (perplexity computation is in background)
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
Perplexity over 182489.000000 words is 198.878107
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 202.254458
198.878107
Done training LM of type 3gram-mincount
Pruning N-grams
Removed 864516 parameters, total divergence 762240.237080
Average divergence per parameter is 0.881696, versus threshold 6.000000
Computing pruned perplexity
After pruning, number of N-grams is 144898
Building ARPA LM (perplexity computation is in background)
interpolate_ngrams: 150613 words in wordslist
interpolate_ngrams: 150613 words in wordslist
Perplexity over 182489.000000 words is 234.889133
Perplexity over 180845.000000 words (excluding 1644.000000 OOVs) is 239.080329
234.889133
ARPA output is in local_lm/3gram-mincount//lm_pr6.0.gz
Done pruning LM with threshold 6.0
Done with LM building. Now formatting LM to FST ...
arpa2fst - 
\data\
Processing 1-grams
Processing 2-grams
Processing 3-grams
Connected 0 states without outgoing arcs.
fstisstochastic local_lm/lang_test_bd_tgpr/G.fst 
1.03712e-05 -0.258947


```
