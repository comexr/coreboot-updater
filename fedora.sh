#!/bin/bash

#Determine variables
model=$(sudo dmidecode -s system-version)

#Install dependencies
sudo dnf install cargo dbus rustc systemd make pkg-config libssl-dev librust-lzma-sys-dev libdbus-1-dev -y
make
sudo make install

#Prepare flash
sudo system76-firmware-cli schedule

#Copy firmware files
sudo cp rom/$model/ec.rom /boot/efi/system76-firmware-update/firmware
sudo cp rom/$model/firmware.rom /boot/efi/system76-firmware-update/firmware
sudo rm -rf /boot/efi/system76-firmware-update/res

#Remove dependencies
sudo make uninstall

#Start flash
sudo reboot