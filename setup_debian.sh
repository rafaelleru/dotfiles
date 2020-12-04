#!/bin/bash

# TODO: cuando se ejecuta como sudo toma como user root
#if [[ $(id -u) != 0 ]]; then
	#echo "Please run this as sudo"
	#exit
#fi

sudo apt install git 

# Obtener mi copia version patcheada de dwm e instalarla en el sistema
git clone https://github.com/rafaelleru/dwm.git $HOME/bin/dwm

cd $HOME/bin/dwm
# Necesito mis dotfiles para configurar dwm
# TODO de momento vamos a usar dotbot, 
git clone https://github.com/rafaelleru/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
git checkout build-solid-script
sudo bash install_deb_packages.sh
bash install

# Build dwm
make
sudo make install

# Obtenemos los programas que ejecuta dwm para que no falle y los instalamos
git clone https://github.com/cdown/clipnotify.git $HOME/bin/clipnotify
cd $HOME/bin/clipnotify
make
sudo install -D -m755 $HOME/bin/clipnotify/clipnotify /usr/bin/clipnotify

git clone https://github.com/cdown/clipmenu.git $HOME/bin/clipmenu
cd $HOME/bin/clipmenu
sudo make install

ln -s $HOME/dotfiles/bin/passmenu $HOME/bin/passmenu

# En ubuntu no podemos obtener alacritty de los repositorios asi que lo vamos a construir (La version snap tiene errores)
git clone https://github.com/alacritty/alacritty.git $HOME/bin/alacritty_src
cd $HOME/bin/alacritty_src

# Instalar rust y cargo para construir alacritty https://github.com/alacritty/alacritty/blob/master/INSTALL.md#prerequisites
# TODO: Quitar entrada manual al instalar
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup override set stable
rustup update stable

# Build alacritty
cargo build --release
ln -s $HOME/bin/alacritty_src/target/release/alacritty $HOME/bin/
sudo cp $HOME/bin/alacritty_src/target/release/alacritty /usr/bin
sudo cp $HOME/bin/passmenu /usr/bin


# Configurar vim bundle
git clone https://github.com/VundleVim/Vundle.vim.git nvim/bundle/Vundle.vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended

# Activar el servicio mbsync para obtener los correos
systemctl --user enable mbsync.timer
systemctl --user start mbsync.timer

# Instalar FZF 
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/bin/fzf
$HOME/bin/fzf/install --all --xdg --no-update-rc

sudo usermod --shell /usr/bin/zsh $USERNAME

# Quitamos gdm3 y habilitamos xdm
# TODO: Al instalar xdm eso se hace automaticamente pero necesita confirmacion manual
#systemctl disable gdm3
#systemctl enable xdm
systemctl reboot
