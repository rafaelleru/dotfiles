#!/bin/bash

sudo apt get update
sudo apt-get upgrade

sudo apt-get install snapd \
                     neovim \
		     autojump \
		     curl \
                     i3-wm \
                     py3status \
                     dmenu \
                     tmux \
                     zsh \
		     python3 \
		     python3-dev \
		     cmake \
		     build-essential \
		     golang \
		     npm \
		     git \
		     mono-complete
		     
cd /tmp
wget https://github.com/alacritty/alacritty/releases/download/v0.4.0/Alacritty-v0.4.0-ubuntu_18_04_amd64.deb
sudo dpkg -i Alacritty-v0.4.0-ubuntu_18_04_amd64.deb

# fzf should be downloaded from git in ubuntu

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --xdg --no-update-rc

usermod --shell /usr/bin/zsh $USERNAME
