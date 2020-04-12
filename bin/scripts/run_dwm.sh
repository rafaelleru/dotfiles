$HOME/bin/earthwall/earthwall.sh&
pulseaudio --daemonize
clipmenud&
compton&
thunderbird&
#slstatus&
clipmenud&
$HOME/dotfiles/bin/scripts/status.sh&

exec dwm 2> /tmp/dwm.log

