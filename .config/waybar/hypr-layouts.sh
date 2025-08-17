#/bin/sh

isfullscreen=$( hyprctl activewindow | awk '$1 ~ /fullscreen:/ {print $2}' )
isfloating=$( hyprctl activewindow | awk '$1 ~ /floating/ {print $2}' )

[ "$isfullscreen" = 0 ] && [ "$isfloating" = 1 ] && echo " ><> " && exit
workspaces=$( hyprctl activeworkspace -j | jq -r .windows )
[ "$isfullscreen" = 1 ] && [ "$isfloating" = 0 ] && echo " [$workspaces] " && exit
echo " []= " && exit

