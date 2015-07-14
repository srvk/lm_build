# Kaldi Language Model Building #
## Adapting Your Own Language Model ##

When you download and unzip this file into a Kaldi experiment like `…/kaldi-trunk/egs/tedlium/s5` you get a folder `lm_build/` with tools and\
 examples of how to adapt and train a language model based on your own training text file. The [README](https://github.com/srvk/Kaldi-LM-Build/blob/master/readme.txt) in that folder gives you an example of how to use the resulting language model files as i\
nput to Kaldi experiments.

There is a chance the system on which you’re running may not have the C++ compiler tools. To make sure it does, please give this command:

`sudo apt-get install build-essential`

Now you are ready to run. The script you run in `lm_build/` is `train_lms.sh`. Here is an example of how to obtain and run it with the exampl\
e training text:

```
#!


wget -qO- http://speechkitchen.org/vms/Data/lm_build.tar.gz | tar xvz
cd lm_build
./train_lms.sh example_text my_lm

```

The output should look like this: [sample output](https://github.com/srvk/Kaldi-LM-Build/blob/master/lm_build_output.txt).

The resulting language model data will appear in a folder beneath the target folder you specified when running the command `train_lms.sh`. Fo\
r example, if you gave the command

`./train_lms.sh example_text local_lm`

the output will appear in the folder

`local_lm/lang_test_bd_tgpr/`

Copy it’s contents into the tedlium experiment’s language model directory (assumes Kaldi is installed in `/kaldi-trunk`)

`cp -r local_lm/lang_test_bd_tgpr/* /kaldi-trunk/egs/tedlium/s5/data/lang`

Re-run the training/model-building experiment to produce a new graph using your new language model. If you’ve already run the main experiment\
 script you can skip some of the earlier stages, and proceed right to stage 3 like this:

`./run.sh --stage 3`

The example words list is about 10% of the size of the tedlium default, and results in a MUCH smaller (and faster) set of models/graphs for d\
ecoding, in the folder

`.../kaldi-trunk/egs/tedlium/s5/exp/tri3_mmi_b0.1`
