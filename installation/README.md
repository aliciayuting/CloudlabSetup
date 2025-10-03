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
If run into error of utility package not found, then removed the source installed colbert, but install colbert from pip (``` pip install colbert-ai```)

Some models use huggingface support, need to login to huggingface to run them

```
huggingface-cli login
```


