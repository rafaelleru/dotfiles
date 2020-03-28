sudo pacman -S git \
	i3-wm \
	py3status \
	dmenu \
	tmux \
	neovim \
	python \
	base-devel \
	cmake \
	go \
	go-tools \
	npm \
	mono \
	alacritty \
	autojump \
	fzf \


# install yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $USERNAME:$USERNAME /yay-git
cd yay-git
makepkg -si
