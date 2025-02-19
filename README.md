# Environment variables and programming shortcuts

to use the env you can call
```
./cloudlab_env.sh ~
```

To use tmux with config
```
./set_tmux.sh
```

For shortcut to the nodes on cloudlab, you can adjust the ssh commands in ```ssh_node.sh``` to the latest ssh commands from Cloudlab reservation.

This script allows you to shortcut ssh to cloudlab via command 

```./ssh_node.ssh node0```...


# Installation

Detailed description could be found here: https://docs.google.com/document/d/108KxSywDMZ3suJ3kaoqFck7SFpBnq902Huu_4PerFM0/edit?tab=t.0

at ```installation/``` directory, we have scripts for setting up Mellanox driver, CUDA driver, toolkit, derecho&cascade installation and vortex dependencies installation. 



# Data download

For experiment data download, we provided shell scripts to get those files, at ```data/``` directory
