#!/bin/bash
CURR_DIR=$(pwd)
cd ~
mkdir workspace
cd workspace
git clone https://github.com/Derecho-Project/vortex.git
cd vortex
cd scripts/
sudo bash install-json.sh
sudo bash install-hnswlib.sh

echo "Installed vortex dependencies"

# Return to the original directory
cd "$CURR_DIR"
