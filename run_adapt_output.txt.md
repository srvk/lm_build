```
Constructing the phoneme-based lexicon
Compiling the lexicon and token FSTs
fstaddselfloops 'echo 47 |' 'echo 152322 |' 
Dict and token FSTs compiling succeeded
Generating candidate_oovs.txt
Not installing the kaldi_lm toolkit since it is already there.
Getting raw N-gram counts
discount_ngrams: for n-gram order 1, D=0.000000, tau=0.000000 phi=1.000000
discount_ngrams: for n-gram order 2, D=0.000000, tau=0.000000 phi=1.000000
discount_ngrams: for n-gram order 3, D=1.000000, tau=0.000000 phi=1.000000
Iteration 1/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=0.675000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=0.675000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=0.825000 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=0.900000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=0.900000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.100000 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.215000 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.215000 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.485000 phi=2.000000
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
Perplexity over 182489.000000 words is 201.050749
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 204.287633

real	0m10.413s
user	0m3.611s
sys	0m3.378s
Perplexity over 182489.000000 words is 201.440967
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 204.643993
Perplexity over 182489.000000 words is 200.930090
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 204.215746

real	0m10.670s
user	0m3.635s
sys	0m3.438s

real	0m10.695s
user	0m3.905s
sys	0m3.284s
Projected perplexity change from setting alpha=0.260041755335771 is 201.050749->200.913687448466, reduction of 0.13706155153389
Alpha value on iter 1 is 0.260041755335771
Iteration 2/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.386046 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.871162 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=1.039534 phi=2.000000
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
Perplexity over 182489.000000 words is 201.166064
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 204.448102

real	0m9.811s
user	0m3.585s
sys	0m3.493s
Perplexity over 182489.000000 words is 200.690749
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.954701

real	0m10.624s
user	0m3.796s
sys	0m3.367s
Perplexity over 182489.000000 words is 200.912099
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 204.185262

real	0m10.819s
user	0m3.800s
sys	0m3.296s
Projected perplexity change from setting alpha=0.669817475279662 is 200.912099->200.625384666329, reduction of 0.286714333671171
Alpha value on iter 2 is 0.669817475279662
Iteration 3/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.750000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=2.000000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=2.350000
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
Perplexity over 182489.000000 words is 200.505709
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.760510

real	0m10.111s
user	0m3.416s
sys	0m3.494s
Perplexity over 182489.000000 words is 200.558394
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.816485

real	0m10.367s
user	0m3.758s
sys	0m3.454s
Perplexity over 182489.000000 words is 200.660567
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.923379

real	0m10.905s
user	0m3.761s
sys	0m3.422s
optimize_alpha.pl: alpha=-0.903760470190559 is too negative, limiting it to -0.5
Projected perplexity change from setting alpha=-0.5 is 200.558394->200.469937095238, reduction of 0.0884569047618697
Alpha value on iter 3 is -0.5
Iteration 4/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.800000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=1.080000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
Perplexity over 182489.000000 words is 208.675941
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 212.150562

real	0m8.388s
user	0m2.501s
sys	0m2.447s
Perplexity over 182489.000000 words is 200.499637
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.751575

real	0m9.427s
user	0m3.742s
sys	0m3.238s
Perplexity over 182489.000000 words is 200.187461
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.412534

real	0m9.528s
user	0m3.565s
sys	0m3.362s
Projected perplexity change from setting alpha=-0.141941407920056 is 200.499637->199.757133979035, reduction of 0.74250302096533
Alpha value on iter 4 is -0.141941407920056
Iteration 5/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.686447, tau=0.850528 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.686447, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.686447, tau=1.530951 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
Perplexity over 182489.000000 words is 200.147155
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.376586

real	0m9.544s
user	0m3.556s
sys	0m3.398s
Perplexity over 182489.000000 words is 200.018991
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.253783

real	0m9.916s
user	0m3.462s
sys	0m3.469s
Perplexity over 182489.000000 words is 200.023841
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.253095

real	0m11.141s
user	0m4.512s
sys	0m2.887s
Projected perplexity change from setting alpha=0.183671574400342 is 200.023841->199.996886601711, reduction of 0.0269543982892912
Alpha value on iter 5 is 0.183671574400342
Iteration 6/6 of optimizing discounting parameters
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.686447, tau=1.342328 phi=1.750000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.686447, tau=1.342328 phi=2.000000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.686447, tau=1.342328 phi=2.350000
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
Perplexity over 182489.000000 words is 200.075739
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.311736

real	0m10.043s
user	0m3.557s
sys	0m3.419s
Perplexity over 182489.000000 words is 200.005327
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.234446
Perplexity over 182489.000000 words is 200.033773
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.267399

real	0m10.580s
user	0m3.715s
sys	0m3.329s

real	0m10.654s
user	0m3.795s
sys	0m3.274s
Projected perplexity change from setting alpha=0.456584087849379 is 200.033773->200.003687543862, reduction of 0.0300854561375559
Alpha value on iter 6 is 0.456584087849379
Final config is:
D=0.6 tau=1.13403757980219 phi=2
D=0.686446873663955 tau=1.34232804751361 phi=2.45658408784938
D=0 tau=2.31444371690591 phi=1.5
Discounting N-grams.
discount_ngrams: for n-gram order 1, D=0.600000, tau=1.134038 phi=2.000000
discount_ngrams: for n-gram order 2, D=0.686447, tau=1.342328 phi=2.456584
discount_ngrams: for n-gram order 3, D=0.000000, tau=2.314444 phi=1.500000
Computing final perplexity
Building ARPA LM (perplexity computation is in background)
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
Perplexity over 182489.000000 words is 199.999783
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 203.226742
199.999783
Done training LM of type 3gram-mincount
Pruning N-grams
Removed 862483 parameters, total divergence 783172.445738
Average divergence per parameter is 0.908044, versus threshold 6.000000
Computing pruned perplexity
After pruning, number of N-grams is 150522
Building ARPA LM (perplexity computation is in background)
interpolate_ngrams: 152315 words in wordslist
interpolate_ngrams: 152315 words in wordslist
Perplexity over 182489.000000 words is 235.108661
Perplexity over 180897.000000 words (excluding 1592.000000 OOVs) is 239.077560
235.108661
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
fstminimizeencoded 
fsttablecompose data/lang_phn_test/L.fst data/lang_phn_test/G.fst 
fstdeterminizestar --use-log=true 
fsttablecompose data/lang_phn_test/T.fst data/lang_phn_test/LG.fst 
Composing decoding graph TLG.fst succeeded
Finished adapting LM, results in  /home/vagrant/eesen/asr_egs/tedlium/v2-30ms/lm_build/data/lang_phn_test
```
