#!/bin/bash

lpci | grep -i nvidia

sudo apt remove --purge '^nvidia-.*'
sudo apt autoremove
sudo apt clean

sudo rm -rf /etc/apt/sources.list.d/nvidia-* 
sudo rm -rf /var/lib/dpkg/info/nvidia* 
sudo rm -rf /usr/local/cuda*

sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub

sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"

sudo apt update

apt-cache policy nvidia-driver-550

sudo apt install nvidia-driver-550
# sudo apt install nvidia-utils-550  # this should not be needed after install driver above

# sudo reboot
echo "Finished installing NVIDIA driver."
echo "Run 'sudo reboot' to apply changes."


