source $HOME/.profile
$HOME/bin/earthwall/earthwall.sh&
pulseaudio --daemonize
clipmenud&
compton&
thunderbird&
#slstatus&
clipmenud&
dunst&
$HOME/dotfiles/bin/scripts/status.sh&

exec dbus-launch `dwm 2> /tmp/dwm.log`
