#!/bin/sh

sudo apt update && sudo apt -y install \
	curl \
	tmux \
	neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --set vi /usr/bin/nvim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --set editor /usr/bin/nvim

mkdir -p $HOME/.config/nvim
ln -fs dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -fs dotfiles/.tmux.conf $HOME
ln -fs dotfiles/.gitconfig $HOME

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
