# Install CMake
sudo apt update
sudo apt install cmake

# Clone derecho and install dependencies
cd ~
mkdir workspace
cd workspace
git clone https://github.com/Derecho-Project/derecho.git
cd derecho
git checkout 2e625af0475bb48e57b60031a13244d85f8330b8
cd scripts/prerequisites
sudo ./install-json.sh
sudo ./install-libfabric.sh
sudo ./install-mutils.sh
sudo ./install-mutils-containers.sh
# install more derecho dependencies: spdlog,ssl
sudo apt update
sudo apt install libspdlog-dev
sudo apt install libssl-dev
# Set over commit for derecho to run
# Run this again after rebook
sudo sysctl -w vm.overcommit_memory=1
# ... Skipped steps to build and install derecho

# Clone cascade and install 
cd ../../../
git clone https://github.com/Derecho-Project/cascade.git
cd cascade
# required for hyper-scan
#    boost
sudo apt install libboost-all-dev
#    regal
sudo apt install build-essential cmake libgl1-mesa-dev libglu1-mesa-dev
sudo apt install libboost-all-dev ragel python3.10 python3-pip -y
cd scripts/prerequisites
sudo ./install-hyperscan.sh
sudo ./install-libwsong.sh
sudo ./install-rpclib.sh
sudo apt install libreadline-dev

# spdlog build
cd ../../../
git clone --branch v1.12.0 https://github.com/gabime/spdlog.git
cd spdlog
mkdir -p build && cd build
cmake .. -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_BUILD_TYPE=Release
make -j32
sudo make install
# verify installation
#ls /usr/local/lib/libspdlog.a


