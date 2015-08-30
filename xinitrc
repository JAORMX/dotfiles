#!/bin/bash

xrdb -merge .Xresources
xsetroot -solid '#3b0039'

# Set UK international keyboard
setxkbmap gb -variant intl

if [ -f ~/.sessionrc ]; then
    source .xsessionrc
fi

xset b off
xset b 0 0 0

xset -b
xset r rate 500 30

xsetroot -cursor_name left_ptr

if [ -x /usr/bin/autocutsel ]; then
    autocutsel &
fi

# Run network applet
nm-applet &

# Set automatic screen configuration
autorandr --change

# Set wallpaper
feh --bg-scale ~/Pictures/wallpaper.jpg

# launch window manager
exec xmonad
