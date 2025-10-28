Sequence of installation:

1. Drivers and dependencies setup

```
mellanox_driver_setup.sh

sudo reboot

cmake_install.sh

alicia_env.sh

derecho_cascade_setup.sh

nvidia_driver_setup.sh

sudo reboot

nvidia_toolkit_setup.sh

alicia_env.sh (Set up environment, since rebooted just now)

# install model before install faiss, due to dependency conflicts between nemo and faiss

faiss_setup.sh

set_overcommit.sh

vortex_setup.sh
```

2. Model installation

```
pipeline_models.sh
```
If run into error of utility package not found, make sure to install colbert and flmr from the customized source code (```pip install -e .```), and export PYTHONPATH=/users/Alicia/workspace/FLMR:$PYTHONPATH


Some models use huggingface support, need to login to huggingface to run them

```
huggingface-cli login
```

for pipeline2.

Install sensevoice's dependencies from its requirements.txt,  and ```pip install kaldi-native-fbank```, transformer version different from pipeline1 transformers==4.44.2, FlagEmbedding==1.3.4, ```pip install "nemo_toolkit[all]"```

``` pip install einops webdataset datasets ipython lightning jiwer lhotse wandb pyannote-core pyannote-metrics nltk```
```pip install faiss-gpu-cu12```
