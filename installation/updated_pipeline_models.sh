#!/bin/bash

PYTHON=python3
CURR_DIR=$(pwd)

echo "Upgrading pip..."
sudo -H $PYTHON -m pip install --upgrade pip setuptools wheel

echo "Installing PyTorch with CUDA 11.8..."
sudo -H $PYTHON -m pip install --ignore-installed \
    torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

echo "Installing NeMo Toolkit..."
sudo -H $PYTHON -m pip install --ignore-installed "nemo_toolkit[all]"

echo "Installing all dependencies from requirements_updated.txt..."
sudo -H $PYTHON -m pip install --ignore-installed -r requirements.txt

echo "finished pip installation"

# Prepare workspace
WORK_DIR=~/workspace
if [ ! -d "$WORK_DIR" ]; then
    echo "Creating $WORK_DIR directory..."
    mkdir -p "$WORK_DIR"
    echo "Directory created: $WORK_DIR"
fi

cd $WORK_DIR

# Clone FLMR (patched version) if not present
if [ ! -d "FLMR" ]; then
    echo "Cloning FLMR..."
    git clone https://github.com/aliciayuting/FLMR.git
fi

echo "Installing FLMR..."
cd FLMR
sudo -H $PYTHON -m pip install --ignore-installed -e .

# Install ColBERT in editable mode
cd third_party/ColBERT
sudo -H $PYTHON -m pip install --ignore-installed -e .

echo "finished flmr installation"

# Return to the original directory
cd "$CURR_DIR"

# Run the Python script
$PYTHON prepare_FLMR.py
echo "finished flmr initialization"

# Clone SenseVoice if not already present
cd $WORK_DIR
if [ ! -d "SenseVoice" ]; then
    echo "Cloning SenseVoice..."
    git clone https://github.com/aliciayuting/SenseVoice.git
fi

echo "All installations completed successfully."
