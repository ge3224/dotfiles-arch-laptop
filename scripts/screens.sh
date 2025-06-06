intern=eDP-1
extern=HDMI-2

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --mode 1600x900
else
    xrandr --output "$intern" --primary --mode 1600x900
    # xrandr --output "$extern" --mode 3840x2160 --scale 0.75x0.75 --right-of "$intern" --auto
    xrandr --output "$extern" --mode 2560x1440 --right-of "$intern" --auto
fi
