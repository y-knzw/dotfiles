#!/bin/bash

sudo apt update
sudo apt install -y software-properties-common python3-software-properties
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim
