#!/bin/bash
source ~/.profile
feh --bg-scale $HOME/Pictures/wallpaper
start-pulseaudio-x11
#compton&
picom&
clipmenud&
dunst&
wmname LG3D
blueman-applet&
setxkbmap -layout us -variant dvp -option caps:escape
$HOME/dotfiles/bin/scripts/status.sh&
redshift -l 37.2:-3.61 &

exec dbus-launch `dwm 2> /tmp/dwm.log`
