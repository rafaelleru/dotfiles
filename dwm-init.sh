#!/bin/bash

exec nm-applet &
exec slstatus &
exec emacsclient -c -a "" -e "(my-org-agenda-list)" &
exec spotify &
exec enpass &
exec feh --bg-scale /home/rafa/Pictures/mountain.jpg &
# exec dwm

while true; do
    #dwm
    dwm 2> ~/.dwm.log
done;
