```
Constructing the phoneme-based lexicon
Compiling the lexicon and token FSTs
fstaddselfloops 'echo 47 |' 'echo 152224 |' 
Dict and token FSTs compiling succeeded
Not installing the kaldi_lm toolkit since it is already there.
Getting raw N-gram counts
discount_ngrams: for n-gram order 1, D=0.000000, tau=0.000000 phi=1.000000
discount_ngrams: for n-gram order 2, D=0.000000, tau=0.000000 phi=1.000000
discount_ngrams: for n-gram order 3, D=1.000000, tau=0.000000 phi=1.000000
Iteration 1/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=0.675000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=0.675000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=0.825000 phi=2.000000
interpolate_ngrams: 152217 words in wordslist
discount_ngrams: for n-gram order 1, D=0.600000, tau=0.900000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=0.900000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.100000 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.215000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.215000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.485000 phi=2.000000
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
Perplexity over 181053.000000 words is 209.024183
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.559836
Perplexity over 181053.000000 words is 209.171298
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.655214

real	0m8.035s
user	0m10.791s
sys	0m2.601s

real	0m8.101s
user	0m10.833s
sys	0m2.399s
Perplexity over 181053.000000 words is 209.610597
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 213.058959

real	0m8.189s
user	0m10.910s
sys	0m2.667s
Projected perplexity change from setting alpha=0.269323916293868 is 209.171298->209.00968103984, reduction of 0.16161696016033
Alpha value on iter 1 is 0.269323916293868
Iteration 2/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.047192 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.396256 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.884946 phi=2.000000
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
Perplexity over 181053.000000 words is 208.769273
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.283193
Perplexity over 181053.000000 words is 209.266660
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.799496

real	0m7.682s
user	0m10.364s
sys	0m2.102s

real	0m7.747s
user	0m10.556s
sys	0m1.948s
Perplexity over 181053.000000 words is 209.004928
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.528374

real	0m7.870s
user	0m10.216s
sys	0m2.471s
optimize_alpha.pl: alpha=0.715617940839648 is too positive, limiting it to 0.7
Projected perplexity change from setting alpha=0.7 is 209.004928->208.686182766667, reduction of 0.318745233333374
Alpha value on iter 2 is 0.7
Iteration 3/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.750000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=2.350000
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
Perplexity over 181053.000000 words is 208.739444
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.251891
Perplexity over 181053.000000 words is 208.570896
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.074371
Perplexity over 181053.000000 words is 208.629619
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.136798

real	0m7.820s
user	0m10.477s
sys	0m2.057s

real	0m7.852s
user	0m10.721s
sys	0m2.053s

real	0m7.874s
user	0m10.467s
sys	0m2.034s
optimize_alpha.pl: alpha=-1.01819663344459 is too negative, limiting it to -0.5
Projected perplexity change from setting alpha=-0.5 is 208.629619->208.528609190476, reduction of 0.101009809523788
Alpha value on iter 3 is -0.5
Iteration 4/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=1.080000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
Perplexity over 181053.000000 words is 216.862919
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 220.596347

real	0m5.975s
user	0m7.500s
sys	0m1.803s
Perplexity over 181053.000000 words is 208.306774
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 211.779895

real	0m7.759s
user	0m10.092s
sys	0m2.478s
Perplexity over 181053.000000 words is 208.557179
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 212.057279

real	0m7.823s
user	0m10.012s
sys	0m2.603s
Projected perplexity change from setting alpha=-0.13822034102841 is 208.557179->207.833452868033, reduction of 0.723726131966629
Alpha value on iter 4 is -0.13822034102841
Iteration 5/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.689424, tau=0.856794 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.689424, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.689424, tau=1.542229 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
Perplexity over 181053.000000 words is 208.159217
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 211.639732
Perplexity over 181053.000000 words is 208.069492
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 211.551362

real	0m7.819s
user	0m10.546s
sys	0m2.304s

real	0m7.851s
user	0m10.562s
sys	0m2.014s
Perplexity over 181053.000000 words is 208.252648
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 211.729666

real	0m7.953s
user	0m10.703s
sys	0m2.027s
optimize_alpha.pl: alpha=0.830271383501567 is too positive, limiting it to 0.7
Projected perplexity change from setting alpha=0.7 is 208.159217->208.0276918, reduction of 0.131525200000084
Alpha value on iter 5 is 0.7
Iteration 6/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.689424, tau=1.942066 phi=1.750000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.689424, tau=1.942066 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.689424, tau=1.942066 phi=2.350000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
Perplexity over 181053.000000 words is 208.088508
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 211.577670
Perplexity over 181053.000000 words is 208.075132
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 211.560050

real	0m7.955s
user	0m10.820s
sys	0m2.131s

real	0m7.962s
user	0m10.722s
sys	0m2.278s
Perplexity over 181053.000000 words is 208.001577
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 211.480323

real	0m8.057s
user	0m10.901s
sys	0m2.078s
optimize_alpha.pl: objective function is not convex; returning alpha=0.7
Projected perplexity change from setting alpha=0.7 is 208.075132->207.8640553, reduction of 0.211076699999978
Alpha value on iter 6 is 0.7
Final config is:
D=0.6 tau=1.14239152466448 phi=2
D=0.689423727177272 tau=1.94206559192962 phi=2.7
D=0 tau=2.37363572346952 phi=1.5
Discounting N-grams.
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.142392 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.689424, tau=1.942066 phi=2.700000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.373636 phi=1.500000
Computing final perplexity
Building ARPA LM (perplexity computation is in background)
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
Perplexity over 181053.000000 words is 208.034153
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 211.511575
208.034153
Done training LM of type 3gram-mincount
Pruning N-grams
Removed 865932 parameters, total divergence 785089.034835
Average divergence per parameter is 0.906641, versus threshold 6.000000
Computing pruned perplexity
After pruning, number of N-grams is 148232
Building ARPA LM (perplexity computation is in background)
interpolate_ngrams: 152217 words in wordslist
interpolate_ngrams: 152217 words in wordslist
Perplexity over 181053.000000 words is 244.906059
Perplexity over 179448.000000 words (excluding 1605.000000 OOVs) is 249.201072
244.906059
ARPA output is in adapt_lm/3gram-mincount//lm_pr6.0.gz
Done pruning LM with threshold 6.0
Finding OOV words in ARPA LM but not in our words.txt
Composing the decoding graph using our own ARPA LM
arpa2fst - 
Processing 1-grams
Processing 2-grams
Processing 3-grams
Connected 0 states without outgoing arcs.
remove_oovs.pl: removed 0 lines.
fsttablecompose data/lang_phn_test/L.fst data/lang_phn_test/G.fst 
fstdeterminizestar --use-log=true 
fstminimizeencoded 
fsttablecompose data/lang_phn_test/T.fst data/lang_phn_test/LG.fst 
Composing decoding graph TLG.fst succeeded
Finished adapting LM, results in  /home/vagrant/eesen/asr_egs/tedlium/v2-30ms/lm_build/data/lang_phn_test
```