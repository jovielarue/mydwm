#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 85 &
xset r rate 200 50 &
picom &
xsetroot -name "welcome, jovie" &
redshift -l 53.55:-113.4687 &

sh ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
