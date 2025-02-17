# CloudlabSetup

Detailed description could be found here: https://docs.google.com/document/d/108KxSywDMZ3suJ3kaoqFck7SFpBnq902Huu_4PerFM0/edit?tab=t.0

Sequence of installation:
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
```
