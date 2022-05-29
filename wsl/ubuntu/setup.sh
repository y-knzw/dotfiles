#!/bin/bash

# Update package list
sudo apt update

# Install Docker
curl -sL https://get.docker.com | sudo sh

# Add user to the docker group
sudo usermod -aG docker $USER

# Install Zsh
sudo apt -y install zsh

# Install prezto
./prezto.sh

# Set Zsh as default shell
sudo chsh $USER -s /bin/zsh

# Install neovim
../../scripts/neovim.sh

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install unzip
sudo apt -y install unzip

# Install zenhan
./zenhan.sh

# Install win32yank
./win32yank.sh

# Install Open SSH Client and socat
sudo apt -y install openssh-client socat

# Set Neovim config
mkdir -p ${HOME}/.config/nvim && cp ../../.config/nvim/init.vim ${HOME}/.config/nvim/

# Set WSL distribution config
sudo cp ./etc/wsl.conf /etc/wsl.conf

# Set auto run docker
echo '
# Run docker
if [ $(service docker status | awk '{print $4}') = "not" ]; then
  sudo service docker start > /dev/null
fi' >> ~/.zprofile

# Set auto run SSH agent
echo '
# Run SSH agent
if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
fi' >> ~/.zprofile

echo "Please re-login for the new changes to take effect."
