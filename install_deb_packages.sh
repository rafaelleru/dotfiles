#!/bin/bash

sudo apt get update
sudo apt-get upgrade

sudo apt-get install snapd \
                     neovim \
		     autojump \
                     i3-wm \
                     dmenu \
                     tmux \
                     alacritty \
		     python3 \
		     python3-dev \

# fzf should be downloaded from git in ubuntu

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf install --all --xdg --no-update-rc
