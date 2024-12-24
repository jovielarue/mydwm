# This is my DWM config!

I've added some changes on top of [siduck/chadwm](https://github.com/siduck/chadwm). These changes include:

- some keyboard remapping
- added the [cool-autostart](https://dwm.suckless.org/patches/cool_autostart/) patch
- customized the status bar
- added my chosen fonts and icons
- gotten my volume keys and brightness keys working
- changed the screenshot program

# Requirements

- imlib2
- xsetroot package (status2d uses this to add colors on dwmbar)
- JetbrainsMono Nerd Font or any nerd font but dont forget to set it in config.def.h
- Make sure to setup your terminal's theme accordingly do chadwm's theme such as nord, onedark etc...

## Other requirements

- picom
- feh
- acpi
- rofi

# Install

```
git clone https://github.com/jovielarue/mydwm ~/.config/chadwm
cd ~/.config/chadwm/
cd chadwm
sudo make install
```

(Note: chmod +x all of the scripts)

# Run chadwm

## With Display Manager

- Create a desktop entry (make sure to change `<user>` with your user):

```shell
sudo touch /usr/share/xsessions/chadwm.desktop
```

```
[Desktop Entry]
Name=chadwm
Comment=dwm
Exec=/home/<user>/.config/chadwm/scripts/./run.sh
Type=Application
```

# Recompile

- You need to recompile dwm after every change you make to its source code.

```
cd ~/.config/chadwm/chadwm
rm config.h
sudo make install
```

# Change themes

- Bar : in bar.sh (line 9) and config.def.h (line 35)
- rofi : in config.rasi (line 15)

# Credits - from [siduck/chadwm](https://github.com/siduck/chadwm)

- HUGE THANKS to [eProTaLT83](https://www.reddit.com/user/eProTaLT83). I wanted certain features in dwm like tabbar in monocle, tagpreview etc and he implemented my ideas and created patches for me! I can't even count the number of times he has helped me :v
- @fitrh helped with [colorful tag patch](https://github.com/fitrh/dwm/issues/1)

# Patches

- barpadding
- bottomstack
- cfacts
- dragmfact
- dragcfact (took from [bakkeby's build](https://github.com/bakkeby/dwm-flexipatch))
- fibonacii
- gaplessgrid
- horizgrid
- movestack
- vanity gaps
- colorful tags
- statuspadding
- status2d
- underline tags
- notitle
- winicon
- [preserveonrestart](https://github.com/PhyTech-R0/dwm-phyOS/blob/master/patches/dwm-6.3-patches/dwm-preserveonrestart-6.3.diff). This patch doesnt let all windows mix up into tag 1 after restarting dwm.
- shiftview
