#!/bin/bash

if [[ $(id -u) != 0 ]]; then
	echo "Please run this as sudo"
	exit
fi

echo "Ejecutando como root"
exit

apt-get update
apt-get upgrade

# programas para obtener programas
apt-get install curl git

mkdir -p $HOME/bin

# Instalar las dependencias para dwm
apt-get install xorg libx11-dev libxft-dev libxinerama-dev xdm suckless-tools dmenu

# Obtener mi copia version patcheada de dwm e instalarla en el sistema
git clone https://github.com/rafaelleru/dwm.git $HOME/bin/dwm

# NEcesito mis dotfiles para configurar dwm
# TODO de momento vamos a usar dotbot, 
git clone https://github.com/rafaelleru/dotfiles.git

cd $HOME/dotfiles
bash install

cd $HOME/dwm
make
make install

# Obtenemos los programas que ejecuta dwm para que no falle y los instalamos
git clone https://github.com/cdown/clipnotify.git $HOME/bin/clipnotify
cd $HOME/bin/clipnotify
make
install -D -m755 $HOME/bin/clipnotify/clipnotify /usr/bin/clipnotify

git clone https://github.com/cdown/clipmenu.git $HOME/bin/clipmenu
cd $HOME/bin/clipmenu
make install

ln -s $HOME/dotfiles/bin/passmenu $HOME/bin/passmenu

# En ubuntu no podemos obtener alacritty de los repositorios asi que lo vamos a construir (La version snap tiene errores)
git clone https://github.com/alacritty/alacritty.git $HOME/bin/alacritty
cd $HOME/bin/alacritty

# Instalar rust y cargo para construir alacritty https://github.com/alacritty/alacritty/blob/master/INSTALL.md#prerequisites
apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup override set stable
rustup update stable

# Build alacritty
cargo build --release

# Instalar tmux, nvim, neomutt y configurar las dependencias
apt-get install zsh tmux neovim python3-neovim neomutt isync
git clone https://github.com/VundleVim/Vundle.vim.git nvim/bundle/Vundle.vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended

# Activar el servicio mbsync para obtener los correos
systemctl --user enable mbsync.timer
systemctl --user start mbsync.timer

apt-get install snapd \
	    	autojump \
		python3 \
		python3-dev \
		golang \
		npm \
		mono-complete \
		nnn

# Instalar FZF 
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/bin/fzf
$HOME/bin/fzf/install --all --xdg --no-update-rc

usermod --shell /usr/bin/zsh $USERNAME
