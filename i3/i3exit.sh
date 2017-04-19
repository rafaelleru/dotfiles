#!/bin/bash
############################################################
# This was taken from https://github.com/andreatta/config/blob/master/i3/i3exit.sh
############################################################

function lock {
    i3lock --ignore-empty-password --show-failed-attempts
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    poweroff)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|reboot|poweroff}"
        exit 2
esac

exit 0
