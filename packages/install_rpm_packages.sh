#!/bin/bash

sudo dnf update
sudo dnf install -y i3wm \
		    py3status \
		    dmenu \
		    neovim \
		    python3-neovim \
		    python \
		    python-devel \
		    tmux \
		    golang \
		    cmake \
		    npm \
		    fzf \
		    autojump \
		    autojump-zsh \
		    make \
		    gcc-c++ \
		    zsh \
		    make

sudo dnf copr enable pschyska/alacritty
sudo dnf install alacritty
