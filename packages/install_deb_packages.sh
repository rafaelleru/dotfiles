#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y curl \
			git\
			xorg \
			libx11-dev libxft-dev libxinerama-dev xdm suckless-tools dmenu \
			cmake pkg-config libfreetype6-dev libfontconfig1-dev libxfixes-dev libxcb-xfixes0-dev python3 \
			xsel \
			zsh tmux neovim python3-neovim \
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
