#!/bin/bash

sudo apt-get --purge remove "*cuda*"

sudo apt-get autoremove

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb

sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-4

export PATH=/usr/local/cuda/bin:$PATH

# check via
echo "Successfully installed CUDA Toolkit. CUDA version:"
nvcc --version

