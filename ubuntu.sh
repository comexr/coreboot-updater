#!/bin/bash

#Install dependencies
sudo apt install cargo dbus rustc systemd make pkg-config libssl-dev librust-lzma-sys-dev libdbus-1-dev -y
make
sudo make install

#Prepare flash
sudo system76-firmware-cli schedule

#Copy firmware files
sudo cp rom/ec.rom /boot/efi/system76-firmware-update/firmware
sudo cp rom/firmware.rom /boot/efi/system76-firmware-update/firmware
sudo rm -rf /boot/efi/system76-firmware-update/firmware/res

#Remove dependencies
sudo make uninstall

#Start flash
sudo reboot