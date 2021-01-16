#!/bin/bash 

sudo pacman -S git \
	tmux \
	neovim \
	python-pynvim \
	python \
	cmake \
	go \
	go-tools \
	npm \
	mono \
	alacritty \
	fzf \
	scrot \
	light

# Uncomment this if using regular arch linux
#sudo pacman -Sy i3-wm 
#sudo pacman -Sy dmenu


## install yay
#cd /opt
#sudo git clone https://aur.archlinux.org/yay-git.git
#sudo chown -R $USERNAME:$USERNAME /yay-git
#cd yay-git
#makepkg -si

yay -S autojump
