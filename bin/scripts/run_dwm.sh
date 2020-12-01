source $HOME/.profile
feh --bg-scale $HOME/Pictures/wallpaper.jpg
start-pulseaudio-x11
#compton&
clipmenud&
dunst&
wmname LG3D
blueman-applet&
$HOME/dotfiles/bin/scripts/status.sh&
redshift -l 37.2:-3.61 &

exec dbus-launch `dwm 2> /tmp/dwm.log`
