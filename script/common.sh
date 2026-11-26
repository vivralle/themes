function replace-files {
theme_dir="$HOME/.config/themes/$selected"
if [ ! -d "$theme_dir" ]; then
    notify-send "Theme Switcher" "Display broke because $selected was not found :<"
    exit 1
fi

configs=(
    "eww"
    "kitty"
    "swaync"
    "waybar"
    "wofi"
    "hypr"
    "sway"
    "mango"
)

for item in "${configs[@]}"; do
    file="$HOME/.config/$item"
    if [[ -e "$file" && ! -L "$file" ]]; then
        notify-send  "Themeswitcher" "Backup $file first!!!."
        exit 1
    fi
done

eww close-all

for item in "${configs[@]}"; do
    rm -rf "$HOME/.config/$item"
    ln -s "$theme_dir/$item" "$HOME/.config/$item"
done

eww reload
}

function reloading {
    case $XDG_CURRENT_DESKTOP in
        Hyprland*)    hyprctl reload ;;
        sway|Sway*)    swaymsg reload ;;
        mango|Mango*)  mmsg -s -d reload_config ;;
    esac
    
    pkill -SIGUSR1 kitty

    swaync-client -R
    swaync-client -rs

    if [ "$selected" = "Skirk" ]; then
        eww open userinfo
        pkill -SIGUSR2 waybar || waybar &
        exit 0
    fi

    eww open userinfo ; eww open yearbox ; eww open monthbox ; eww open daybox ; eww open todaybox ; eww open powermenu
    pkill -SIGUSR2 waybar || waybar &
}