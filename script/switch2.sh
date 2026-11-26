#!/bin/bash
#The Cli version
source "$HOME/.config/themes/script/common.sh"
selected="$1"

if [ -z "$selected" ]; then
    read -r -p "What theme would you like to switch to?  " selected
fi

selected="${selected,,}"
selected="${selected^}"

if [ -z "$selected" ]; then
    notify-send "Theme Switcher" "You don't want to switch? D:"
    exit 0
fi

replace-files

if ! pgrep -x awww-daemon > /dev/null; then
    awww-daemon &
fi

case $selected in
    Autumn*)    awww img -t grow --transition-pos bottom-right ~/.config/themes/Autumn/j1.png &  ;;
    Rain*)      awww img -t grow --transition-pos bottom-right ~/.config/themes/Rain/e1.png &    ;;
    Test*)      awww img -t grow --transition-pos bottom-right ~/.config/themes/Rain/e1.png &    ;;
    Robin*)     awww img -t grow --transition-pos bottom-right ~/.config/themes/Robin/r1.webp &  ;;
    Clovers*)   awww img -t grow --transition-pos bottom-right ~/.config/themes/Clovers/c4.png & ;;
    Void*)      awww img -t grow --transition-pos bottom-right ~/.config/themes/Void/C1.png &    ;;
esac

if [ "$selected" = "Skirk" ]; then
    awww img -t grow --transition-pos bottom-right ~/.config/themes/Skirk/aa.jpg
    sleep 2
    reloading 
    exit 0
fi

reloading
