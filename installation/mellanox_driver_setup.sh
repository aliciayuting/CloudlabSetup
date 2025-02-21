#!/bin/bash

# Use version 23.10-3.2.2.0 and tgz download option
wget https://content.mellanox.com/ofed/MLNX_OFED-23.10-3.2.2.0/MLNX_OFED_LINUX-23.10-3.2.2.0-ubuntu22.04-x86_64.tgz
tar -xvzf MLNX_OFED_LINUX-23.10-3.2.2.0-ubuntu22.04-x86_64.tgz
cd MLNX_OFED_LINUX-23.10-3.2.2.0-ubuntu22.04-x86_64
sudo ./mlnxofedinstall

echo "Finished installing MLNX driver." 
echo "Run 'sudo reboot' to apply changes."

# sudo reboot after finish this
# Then verify via
#   ofed_info -s

echo "After sudo verify via 'ofed_info -s'"
