#!/bin/sh
intern='eDP-1'
extern='HDMI-2'

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --mode 1600x900
fi
xrandr --output "$intern" --primary --auto --output "$extern" --right-of "$intern" --mode 1600x900
