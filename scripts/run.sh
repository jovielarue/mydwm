#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 85 &
# feh --bg-fill ~/Pictures/background.jpg &
xset r rate 200 50 &
picom &
xsetroot -name "welcome, jovie"

sh ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
