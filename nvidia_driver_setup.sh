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

sudo apt install nvidia-utils-550

sudo reboot

sudo apt-get --purge remove "*cuda*"

sudo apt-get autoremove

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb

sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-4

export PATH=/usr/local/cuda/bin:$PATH

# check via
nvcc --version

