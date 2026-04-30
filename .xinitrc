# Xresources
xrdb $XRESOURCES

# Wallpaper
# (this process in not moved to the background because it allows
# enough time for pipewire to start properly)
~/.local/bin/wallpaper

# Compositor
picom --legacy-backends &

# Notifications
dunst &

# Calendar
#calcurse --daemon

# Set correct keyboard layout & swap Esc and Caps Lock & type faster
setxkbmap latam && \
setxkbmap -option caps:swapescape && \
setxkbmap -option compose:paus && \
xmodmap -e "keycode 135 = Super_L" && \
xset r rate 300 50

# Turn off trackpad
#xinput set-prop 11 "Device Enabled" 0


# Night light
#redshift -x; redshift -O 3600

# Audio
pipewire &
pipewire-pulse &
#/usr/bin/pipewire-media-session &
wireplumber &

# Just launch dwn
#exec dwm

# Lauch and relauch when closed (facilitates dwm config.h changes)
while true; do
	dwm >/dev/null 2>&1
done


