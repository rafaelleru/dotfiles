#!/bin/bash
intern=LVDS1
externVGA1=VGA1
externHDMI=HDMI1

function ExternHDMI {
    xrandr --output "$externHDMI" --auto
}

function ExternVGA {
    xrandr --output "$externVGA1" --auto
}

function Intern {
    xrandr --output "$intern" --auto
}

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi
