![](./screenshot.png?raw=true)

# Dotfiles

These are my *nix dotfiles.

*I am no longer using emacs so I don't know if it will work directly or if it needs some fixes* 

Currently I am using `i3wm` as my X11 window manager. Bellow you cand find some keybindings to use it.

- `Alt` + `h` moves the focus to the left.
- `Alt` + `j` moves the focus down.
- `Alt` + `k` moves the focus up.
- `Alt` + `l` moves the focus to the right.
- This will also work with arrow keys.

- `Alt` + `Enter` opens a new terminal.
- `Alt` + `Shift` + `Enter` open neovim.
- `Alt` + `d` exec dmenu.
- `Alt` + `q` quits focused window.
- `Alt` + `p` exec passmenu.
- `Alt` + `y` exec clipmenu.
- `Alt` + `Shift` + `m` multimedia control mode.
- `Alt` + `Esc` i3 session manager mode.

My editor is `neovim`, to use YouCompleteMe plugin you will need to run `install.py`. The steps are:

	cd ~/.config/nvim/bundle/YouCompleteMe/
	python install.py

If you use the packages scripts in this repository it will run without problems.

`alacritty` is my terminal emulator and `tmux` helps me to manage multiple terminals, sessions, etc.

## How to use this repository:

### Debian based distros

	git clone https://github.com/rafaelleru/dotfiles/tree/master dotfiles
	cd dotfiles
	./install
	./install_deb_packages.sh # Optional

### Fedora/RedHad Linux

	git clone https://github.com/rafaelleru/dotfiles/tree/master dotfiles
	cd dotfiles
	./install
	./install_dnf_packages.sh # Opcional

### Arch Linux

	git clone https://github.com/rafaelleru/dotfiles/tree/master dotfiles
	cd dotfiles
	./install.sh
	./install_pacman_packages.sh # Opcional
