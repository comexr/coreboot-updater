#!/bin/bash
sudo apt install cargo dbus rustc systemd -y
make
sudo make install