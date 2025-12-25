#!/bin/sh

# eGPU
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# Xresources
xrdb $XRESOURCES

# Wallpaper
~/.local/bin/wallpaper

# Compositor
picom &

# Notifications
dunst &

# Set correct keyboard layout & swap Esc and Caps Lock & type faster
setxkbmap latam
setxkbmap -option caps:swapescape
setxkbmap -option compose:paus
xmodmap -e "keycode 135 = Super_R"
xmodmap -e "keycode 107 = Super_R"
#numlockx on
xset r rate 300 50

## Turn off trackpad
#xinput set-prop 11 "Device Enabled" 0

## Speed up trackpoint
# https://wiki.archlinux.org/title/TrackPoint
xinput set-prop "Elan TrackPoint" "libinput Accel Speed" 1

## Extra touchscreen processing
touchegg &

## Removing annoyingly persistent files
##rm ~/.fehbg
#rm ~/.wget-hsts
#rm ~/.python_history
rm -fr ~/.pki
rm -fr ~/.fontconfig
rm -fr ~/.gphoto

# Night light
#redshift -x; redshift -O 3600

# Audio
pipewire &
pipewire-pulse &
wireplumber &

# Status bar
dwmblocks &

# Start D-Bus session (temporary fix)
if command -v dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# Set environment variables for D-Bus
export $(dbus-launch)

# 1. Just launch dwn
#exec dwm

## 2. Lauch and relauch when closed
## (facilitates dwm config.h changes)
while true; do
	dwm >/dev/null 2>&1
done
