source $HOME/.profile
$HOME/bin/earthwall/earthwall.sh&
start-pulseaudio-x11
clipmenud&
compton&
thunderbird&
clipmenud&
dunst&
wmname LG3D
blueman-applet&
$HOME/dotfiles/bin/scripts/status.sh&

exec dbus-launch `dwm 2> /tmp/dwm.log`
