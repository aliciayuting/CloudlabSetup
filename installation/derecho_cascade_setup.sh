# Install CMake
# Use the script in the doc to install cmake with specific version
# sudo apt update
# install cmake # Please DO NOT use (pip install) to install Cmake, because Derecho and Cascade has dependencies on CMake 3.31, use the script in the doc to install from source code
# Please copy the commands in this script line-by-line to the servers' terminals to install. TODO: haven't tested run it as  a script completely, will do this soon.

# Clone derecho and install dependencies
cd ~
mkdir workspace
cd workspace
git clone https://github.com/Derecho-Project/derecho.git
cd derecho
# git checkout 2e625af0475bb48e57b60031a13244d85f8330b8 # this step checkout a particular version, now is not needed
cd scripts/prerequisites
sudo ./install-json.sh
sudo ./install-libfabric.sh
sudo ./install-mutils.sh
sudo ./install-mutils-containers.sh
# install more derecho dependencies: spdlog,ssl
sudo apt update
# sudo apt install libspdlog-dev DONOT use this way to install spdlog, version incorrect, use below method
# Install spdlog:
cd ~/workspace
git clone --branch v1.12.0 https://github.com/gabime/spdlog.git
cd spdlog
mkdir -p build && cd build
cmake .. -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${SPDLOG_PREFIX}
make -j32
sudo make install
# verify installation
#ls /usr/local/lib/libspdlog.a

sudo apt install libssl-dev
# Set over commit for derecho to run
# Run this again after rebook
sudo sysctl -w vm.overcommit_memory=1
#  build and install derecho
cd ~/workspace/derecho
# Before running below line
# Please edit ~/CloudlabSetup/install_env.sh and set the opt-home to your user directory (your username on cloudlab) on cloudlab
source ~/CloudlabSetup/env_temp.sh
# above should set the derecho install location to your own user space, you can test it via below line, make sure it isn't /usr/local, but /home/USERNAME/opt-dev
echo "$DERECHO_INSTALL_PREFIX"
./build.sh Release
cd build-Release
make -j32
sudo make install


# Clone cascade and install 
cd ~/workspace
git clone https://github.com/Derecho-Project/cascade.git
cd cascade

read -p "Use cascade put_nparray branch? (y/n): " response
response=${response,,}
if [[ "$response" == "y" ]]; then
    git checkout put_nparray
fi

# required for hyper-scan
#    boost
sudo apt install libboost-all-dev
#    regal
sudo apt install build-essential cmake libgl1-mesa-dev libglu1-mesa-dev -y
sudo apt install libreadline-dev libboost-all-dev ragel python3.10 python3-pip -y
cd scripts/prerequisites
sudo ./install-hyperscan.sh
sudo ./install-libwsong.sh
sudo ./install-rpclib.sh
sudo apt install libreadline-dev -y

# build cascade
# install cascade python requirements
sudo pip install pybind11
sudo pip install build
sudo apt install python3.10-venv

cd ~/workspace/cascade
# env script used when installing derecho should also set the cascade install location to your own user space, you can test it via below line, make sure it isn't /usr/local, but /home/USERNAME/opt-dev
echo "$CASCADE_INSTALL_PREFIX"
./build.sh Release
cd build-Release
make -j32
sudo make install
cd src/service/python/dist
sudo pip install derecho_cascade-1.0.2-py3-none-any.whl


