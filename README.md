# Information:

This is a set of MY personally curated dotfiles so you'll probably have to make changes and tinker around with the script as i used a lot of absolute paths in the files of basically everything

you'll also need:
- wofi
- hyprland
- kitty
- swaync
- waybar
- eww
- awww

## BEWARE WARNING WARNING BEWARE
**THE THEME SWITCHER RUNS RM -RF ON YOUR FILES**
THOUGH IT CHECKS IF YOU HAVE REAL FILES AND STOPS, FOR THE LOVE OF GOD, 

**BACK UP YOUR CONFIGS FIRST BEFORE TRYING IT. CHECK THE CODE BEFORE YOU RUN IT**

(INCLUDING THE EWWW, THE CLI AND EWWW CONTROL PANEL VERSION OF THE SCRIPT[named switch.sh and switch2.sh in the "script" folder respectively, while you are at it, read common.sh and themeswitcher.sh as well since common.sh is the required by all other 3 themeswitcher scripts])
(btw, it deletes the config files of eww, wofi, hyprland, swaync, waybar, kitty, sway, mango... READ THE SCRIPT FIRST BRO)

## Experimental Items:
the sway and the mangowm configs are currently experimental and kicking my ass, i got the theme switcher to properly detect them, but i am currently fighting the .conf folders, so don't expect to get this on sway and mango right now, but you can expect it can be there soon enough i guess.... or you can just download the folder and replace my broken mango and sway configs with your proper working configs and cross reference the keybinds with my hyprland lua file

## Installation
im not making an installation script for you, just dump the main folder, "themes" into your .config and inspect it
suppose, after the main folder is installed in your Downloads directory,
'cp ~/Downloads/themes ~/.config/'
after that, you need to inspect the files to see which ones have the absolute path, and replace the "viv" with your user
