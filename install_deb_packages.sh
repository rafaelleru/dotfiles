#!/bin/bash

sudo apt get update
sudo apt-get upgrade

sudo apt-get install curl \
			git\
			xorg \
			libx11-dev libxft-dev libxinerama-dev xdm suckless-tools dmenu \ #dwm
			cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 \ #alacritty
			zsh tmux neovim python3-neovim \  #dev
			neomutt \
			isync \
			snapd \
		     	autojump \
		     	curl \
		     	python3-dev \
		     	build-essential \
		     	golang \
		     	npm \
		     	mono-complete 
