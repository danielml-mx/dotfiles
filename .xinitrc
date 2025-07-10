# Xresources
#[[ -f ~/.config/Xresources ]] && xrdb ~/.config/Xresources
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrdb $XRESOURCES

# Brightness 
#echo 8 | sudo tee /sys/class/backlight/acpi_video0/brightness
#

export $(dbus-launch)
export DBUS_SESSION_BUS_WINDOWID=18874369

# Wallpaper
~/.local/bin/wallpaper

# Compositor:
picom &

# Notifications
dunst &

# Calendar
calcurse --daemon && ~/.local/bin/startup-calcurse &
#conky &

# Set correct keyboard layout & swap Esc and Caps Lock & type faster
setxkbmap latam
setxkbmap -option caps:swapescape
setxkbmap -option compose:paus
xmodmap -e "keycode 135 = Super_R"
xmodmap -e "keycode 107 = Super_R"
numlockx on
xset r rate 300 50

## Turn off trackpad
#xinput set-prop 11 "Device Enabled" 0
#
## Speed up trackpoint
# https://wiki.archlinux.org/title/TrackPoint
xinput set-prop 12 344 0.5

## Extra touchscreen processing
touchegg &

## Removing annoyingly persistent files
##rm ~/.fehbg
#rm ~/.wget-hsts
#rm ~/.python_history
##rm ~/.lesshst
rm -fr ~/.pki
rm -fr ~/.fontconfig
rm -fr ~/.gphoto
###rm -fr ~/.dbus
#rmdir ~/media/usb
#rmdir ~/Media/ADATA

# Night light
#redshift -x; redshift -O 3600

# Basic status bar
#while true; do
#	xsetroot -name " BAT1: $(cat /sys/class/power_supply/BAT0/capacity)% | BRIGHT: $(printf %.0f $(light -G))% | VOL: $(pamixer --get-volume-human) | $(date +'%a %h %d %r %Z %Y') |  " &
#                sleep 1
#done &
#~/.local/bin/statusbar &

# Audio
pipewire &
pipewire-pulse &
#/usr/bin/pipewire-media-session &
wireplumber &

# Just launch dwn
#exec dwm

dwmblocks &	# pendiente
## Lauch and relauch when closed
while true; do
	dwm >/dev/null 2>&1
done
# (facilitates dwm config.h changes)
