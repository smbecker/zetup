#!/bin/bash

gsettings set org.gnome.desktop.background picture-uri "https://512pixels.net/downloads/macos-wallpapers/10-14-Night.jpg"
gsettings set org.gnome.desktop.screensaver picture-uri "https://512pixels.net/downloads/macos-wallpapers/10-14-Night.jpg"
gsettings set org.gnome.desktop.screensaver primary-color "#073642"
gsettings set org.gnome.desktop.background show-desktop-icons "false"

cd $HOME

git clone https://github.com/vinceliuice/Mojave-gtk-theme.git
git clone https://github.com/vinceliuice/McMojave-circle.git

cd $HOME/Mojave-gtk-theme
chmod +x install.sh
./install.sh

cd $HOME/McMojave-circle
rm -rf $HOME/Mojave-gtk-theme

chmod +x install.sh
./install.sh

cd $HOME
rm -rf $HOME/McMojave-circle

gsettings set org.gnome.desktop.interface icon-theme "McMojave-circle"
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-White"
gsettings set org.gnome.desktop.interface gtk-theme "Mojave-dark"

gsettings set org.gnome.desktop.interface monospace-font-name "Meslo LG S for Powerline 13"
gsettings set org.gnome.desktop.interface font-name "Garuda 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Garuda Bole 12"
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

# Setup plank
sudo apt-get install -y plank
nohup plank &>/dev/null &

mkdir -p $HOME/.config/autostart
cp /usr/share/applications/plank.desktop $HOME/.config/autostart/

gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed "false"

# Setup terminal
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1} # remove leading and trailing single quotes
terminalSetting="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/"
gsettings set $terminalSetting default-size-columns 120
gsettings set $terminalSetting default-size-rows 25
gsettings set $terminalSetting use-system-font "false"
gsettings set $terminalSetting font "Meslo LG S for Powerline 13"
dconf write /org/gnome/terminal/legacy/theme-variant "'dark'"
dconf write /org/gnome/terminal/legacy/new-terminal-mode "'tab'"

gsettings set $terminalSetting visible-name "Personal"
gsettings set $terminalSetting background-color "#073642"
gsettings set $terminalSetting foreground-color "#FDF6E3"
gsettings set $terminalSetting bold-color "#FDF6E3"
gsettings set $terminalSetting bold-color-same-as-fg "true"
gsettings set $terminalSetting use-theme-colors "false"
gsettings set $terminalSetting use-theme-background "false"
gsettings set $terminalSetting allow-bold "true"
gsettings set $terminalSetting palette "['#6A6A78787A7A', '#E9E965653B3B', '#3939E9E9A8A8', '#E5E5B6B68484', '#4444AAAAE6E6', '#E1E175759999', '#3D3DD5D5E7E7', '#C3C3DDDDE1E1', '#595984848989', '#E6E650502929', '#0000FFFF9A9A', '#E8E894944040', '#00009A9AFBFB', '#FFFF57578F8F', '#5F5FFFFFFFFF', '#D9D9FBFBFFFF']"
