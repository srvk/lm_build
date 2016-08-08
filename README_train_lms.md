
## Preparation

   Prepare LM training text. An example is provided as `example_txt`. Change it if you want to build upon your own text data.
   If your training data has a small vocabulary or grammar, it helps to repeat the text data several times, and append it to
   the provided training data. In this way, a large vocabulary and grammar are still available as a fallback, but the
   likelihood of transcriptions matching your own data will be increased. For example if `example_txt` is 100,000 sentences
   long, you could repeat your training data to total 100,000 sentences. That will then result in a LM that is overall
   weighted 50% toward your domain, and 50% toward the more general `example_txt` domain.

## Building

Run:  ./train_lms.sh <train_txt> <wdir>
The script takes two arguments: the path to your LM training text file, and a working (output) direcotry
For example:

  ./train_lms.sh example_txt local_lm

## Where to find the LM

The `lang_test_bd_tgpr` direcotry under <wdir> is the decodable LM that you need for decoding.

## Further Steps

Once the LM has been created, you will likely next want to compose it with other models and compile
them into a decoding graph, like `HCLG.fst` or `TLG.fst`.




