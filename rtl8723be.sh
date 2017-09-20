#!/bin/bash

 # install additional dependencies
 
sudo apt-get install linux-firmware linux-headers-$(uname -r) gcc g++ build-essential dkms git

 # clone latest drivers

git clone https://github.com/lwfinger/rtlwifi_new.git

 # make and install realtek driver

cd rtlwifi_new

make -j4

sudo make install

 # adding modules to kernal
 
echo "options rtl8723be ant_sel=2 fwlps=0" | sudo tee /etc/modprobe.d/rtl8723be.conf


sudo modprobe -r rtl8723be


sudo modprobe -v rtl8723be ant_sel=2

echo "Install complete!"
