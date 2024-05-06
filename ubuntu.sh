#!/bin/bash
sudo apt install cargo dbus rustc systemd make -y
make
sudo make install