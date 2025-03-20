# install ssl
CURR_DIR=$(pwd)
sudo apt update
sudo apt install libssl-dev

wget https://github.com/Kitware/CMake/releases/download/v3.31.0/cmake-3.31.0.tar.gz
tar -xvzf cmake-3.31.0.tar.gz
cd cmake-3.31.0
./bootstrap
make -j32
sudo make install

cd CURR_DIR

