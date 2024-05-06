#!/bin/bash
sudo apt install cargo dbus rustc systemd make pkg-config libssl-dev librust-lzma-sys-dev libdbus-1-dev -y
make
sudo make install