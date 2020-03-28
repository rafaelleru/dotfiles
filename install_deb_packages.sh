#!/bin/bash

sudo apt get update
sudo apt-get upgrade

sudo apt-get install snapd \
                     neovim \
		     autojump \
                     i3-wm \
                     py3status \
                     dmenu \
                     tmux \
                     zsh \
		     python3 \
		     python3-dev \
		     # YouCompleteMe
		     cmake \
		     build-essential \
		     go \
		     npm \
		     mono-complete
		     

sudo snap --classic install alacritty

# fzf should be downloaded from git in ubuntu

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --xdg --no-update-rc

