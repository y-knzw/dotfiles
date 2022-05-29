#!/bin/bash

curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o nvim
sudo mv -f nvim /usr/local/bin/
chmod u+x /usr/local/bin/nvim

sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/nvim 60
sudo update-alternatives --set vi /usr/local/bin/nvim
sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/nvim 60
sudo update-alternatives --set vim /usr/local/bin/nvim
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 60
sudo update-alternatives --set editor /usr/local/bin/nvim
