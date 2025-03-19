#!/bin/bash

CURR_DIR=$(pwd)

sudo pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

sudo pip install -r requirements.txt

echo "finished pip installation"

cd ~

WORK_DIR=~/workspace
if [ ! -d "$WORK_DIR" ]; then
    echo "Creating $WORK_DIR directory..."
    mkdir -p "$WORK_DIR"
    echo "Directory created: $WORK_DIR"
fi



cd workspace
# Use the FLMR with TC's fix
git clone https://github.com/tcyuan373/FLMR.git
cd FLMR
sudo pip install -e . 

cd third_party/ColBERT
sudo pip install -e .

echo "finished flmr installation"

# Return to the original directory
cd "$CURR_DIR"

# Run the Python script
python prepare_FLMR.py
echo "finished flmr initialization"
