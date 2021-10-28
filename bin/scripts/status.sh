#!/bin/bash

while true
do
	date=`date '+%Y-%m-%d %H:%M:%S'`
	if [[ -f '/sys/class/power_supply/BAT0/capacity' ]]; then
		bat='|  '$(cat /sys/class/power_supply/BAT0/capacity)%\ $(cat /sys/class/power_supply/BAT0/status)
	else
		bat=''
	fi
	vol=`amixer get Master | tail -n1 | grep -Po '\\[\\K[^%]*' | head -n1`
	wifi_name=`nmcli | grep -m 1 wlp2s0 | cut -d ' ' -f 4`
	mem=`free -h | grep Mem: | awk 'OFS="/" {print $3, $2}'`
	swap=`free -h | grep Swap: | awk 'OFS="/" {print $3, $2}'`
	brightness=$(light)\%
	load=`uptime | awk '{print $10}'` # $11, $12
	load=${load%?};
	cpu=`awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' <(grep 'cpu ' /proc/stat) <(sleep 0.1; grep 'cpu ' /proc/stat)`
	temp=`sensors | grep Package | awk 'F=" " {print $4}'`


	# This line is here in case I cannot use utf-8 fonts. This should not happen since fonts are in my dotfiles repository
	#echo "CPU: $cpu | RAM: $mem | SWAP: $swap | LOAD: $load | WIFI: $wifi_name | BRIGHTNESS: $brightness | VOL: $vol % | BAT: $bat | $date"
	xsetroot -name " $cpu [$temp]| $load| $mem| $swap| $wifi_name| $brightness| $vol%$bat|$date"
	sleep 1
done
