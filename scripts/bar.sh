#!/bin/sh

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/nord

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$darkblue^  "
  printf "^c$blue^ ^b$grey^  $cpu_val "
}

battery() {
  printf '%s' "^c$black^ ^b$darkblue^ $(nbattery)"
  printf '%s' "^c$darkblue^ ^b$grey^  $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -oP '(?<=percentage:)\s*\K\d+(?:\.\d+)?%')"
}

brightness() {
  printf "^c$black^ ^b$darkblue^  "
  printf "^c$blue^ ^b$grey^ "
  printf " $(xbacklight -get |awk -F'[.,]' '{print $1}')"
}

volume() {
  printf "^c$black^ ^b$darkblue^  󰕾 "
  printf "%b" "^c$blue^ ^b$grey^  $(amixer -c 0 -M -D pulse get Master | grep -o -E [[:digit:]]+% | head -1)"
}

mem() {
  printf "^c$black^^b$blue^   "
  printf "^c$blue^^b$grey^  $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨  ^d^%s "  ;;
	down) printf "^c$black^ ^b$blue^ 󰤭  ^d^%s" ;;
	esac
}

clock() {
  printf "^c$blue^ ^b$grey^  $(date '+%a %b. %e') ^c$black^ ^b$blue^ $(date '+%H:%M') "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
  interval=$((interval + 1))
  sleep 1 && xsetroot -name "   $(brightness) $(volume) $(cpu) $(mem) $(battery) $(wlan) $(clock)"
done
