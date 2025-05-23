#!/bin/bash

sudo pip uninstall faiss-cpu
sudo pip uninstall faiss-gpu
sudo pip uninstall faiss
sudo rm -rf ~/workspace/faiss

CURR_DIR=$(pwd)
# Move this setup script to workspace
# Then Install dependencies Blas
# Remember to install NVidia driver and toolkit and run below commands before running this script
sudo apt update
sudo apt install libblas-dev -y
sudo apt install liblapack-dev -y
sudo apt install python3-dev python3-numpy -y

# This line should be set in env variables
export PATH=/usr/lib/cuda/bin:$PATH

cd ~/workspace
git clone https://github.com/facebookresearch/faiss.git
cd faiss
git checkout v1.9.0
build_path="build"
if [ -z $FAISS_INSTALL_PREFIX ]; then
    install_prefix="/usr/local"
else
    install_prefix=$FAISS_INSTALL_PREFIX
fi
echo "FAISS library will be installed in $install_prefix"

if [ -z $CUDAToolKitRoot ]; then
    cudatoolkit_dir="/usr/local/cuda-12.4"
else
    cudatoolkit_dir=$CUDAToolKitRoot
fi

# Python interface is currently not needed for vortex, but it is needed to buildthe GIST dataset with clusters. So need to install it on the server that handle the data processing
read -p "Install FAISS Python interface? (y/n): " response
response=${response,,}

if [[ "$response" == "y" ]]; then
    enable_python="ON"
elif [[ "$response" == "n" ]]; then
    enable_python="OFF"
else
    echo "Invalid response. Please enter 'y' or 'n'."
fi

# CUDA_ARCHITECTURES: specify the target CUDA architectures.
# A30 on d7525 is 75
cuda_archs="80"

# More about the flags setting checkout https://github.com/facebookresearch/faiss/blob/main/INSTALL.md
cmake_defs="-DCMAKE_BUILD_TYPE=${build_type} \
          -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_INSTALL_PREFIX=${install_prefix} \
	  -DCMAKE_CXX_STANDARD=20\
	  -DFAISS_ENABLE_GPU=ON -DFAISS_ENABLE_PYTHON=${enable_python} -DFAISS_ENABLE_RAFT=OFF \
          -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON -DFAISS_ENABLE_C_API=ON \
          -DCUDAToolkit_ROOT=${cudatoolkit_dir} -DCMAKE_CUDA_ARCHITECTURES=${cuda_archs}"

sudo rm -rf ${install_prefix}/include/faiss ${install_prefix}/lib/libfaiss* ${install_prefix}/lib/cmake/faiss
sudo rm -rf ${build_path} 2>/dev/null
mkdir ${build_path}
cd ${build_path}
cmake ${cmake_defs} ..
NPROC=`nproc`
if [ $NPROC -lt 2 ]; then
    NPROC=2
fi
sudo make faiss -j `expr $NPROC - 1` 2>err.log
sudo make install

if [[ "$response" == "y" ]]; then
    echo "Installing FAISS Python interface..."
    make -j swigfaiss
    cd faiss/python
    sudo python setup.py install
    cd ../../..
fi

echo "FAISS installed successfully."
# clean up
rm -rf faiss

# Return to the original directory
cd "$CURR_DIR"
