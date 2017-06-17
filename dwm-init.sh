#!/bin/bash

exec nm-applet &
exec blueman-applet &
exec slstatus &
exec feh --bg-scale /home/rafa/Pictures/mountain.jpg &
exec wmname LG3D
# exec dwm

while true; do
    #dwm
    dwm 2> ~/.dwm.log
done;
