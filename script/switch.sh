#!/bin/bash
#Thw eww-version
source "$HOME/.config/themes/script/common.sh"
selected="$1"

if [ -z "$selected" ]; then
    exit 0
fi

if [ "$selected" = "Exit" ]; then
    notify-send "Free cupcakes :D" "Exited gracefully! If you're reading this, you now owe me a cupcake"
    exit 0
fi

replace-files

if ! pgrep -x awww-daemon > /dev/null; then
    awww-daemon &
fi


case $selected in
    Autumn*)    awww img -t wipe --transition-angle 0 ~/.config/themes/Autumn/j1.png &  ;;
    Rain*)      awww img -t wipe --transition-angle 0 ~/.config/themes/Rain/e1.png &    ;;
    Test*)      awww img -t wipe --transition-angle 0 ~/.config/themes/Rain/e1.png &    ;;
    Robin*)     awww img -t wipe --transition-angle 0 ~/.config/themes/Robin/r1.webp &  ;;
    Clovers*)   awww img -t wipe --transition-angle 0 ~/.config/themes/Clovers/c4.png & ;;
    Void*)      awww img -t wipe --transition-angle 0 ~/.config/themes/Void/C1.png &    ;;
esac

if [ "$selected" = "Skirk" ]; then
    awww img -t grow --transition-pos bottom-right ~/.config/themes/Skirk/aa.jpg
    sleep 2
    reloading 
    exit 0
fi

sleep 0.5
reloading
