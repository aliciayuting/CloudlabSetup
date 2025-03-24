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

faiss_setup.sh

set_overcommit.sh

vortex_setup.sh
```

2. Model installation

```
pipeline_models.sh
```

Some models use huggingface support, need to login to huggingface to run them

```
huggingface-cli login
```


