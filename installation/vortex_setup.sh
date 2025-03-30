#!/bin/bash
CURR_DIR=$(pwd)
cd ~
mkdir workspace
cd workspace
git clone https://github.com/aliciayuting/vortex.git
cd vortex
cd scripts/
sudo bash install-curl.sh
sudo bash install-hnswlib.sh

echo "Installed vortex dependencies"

git checkout ml_pipeline2
git submodule update --init --recursive

# Return to the original directory
cd "$CURR_DIR"
