#!/bin/bash
echo "UPDATE"
sudo apt-get update
echo "UPGRADE"
sudo apt-get upgrade -y
echo "REMOVE"
sudo apt-get remove
echo "AUTOREMOVE"
sudo apt-get autoremove
echo "CLEAN"
sudo apt-get clean
echo "AUTOCLEAN"
sudo apt-get autoclean
echo "UPDATE FLATPAK"
flatpak update -y
