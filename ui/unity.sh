#!/bin/bash

gsettings set org.gnome.desktop.screensaver primary-color "#000000"
gsettings set org.gnome.desktop.screensaver secondary-color "#000000"
gsettings set org.gnome.desktop.background show-desktop-icons "false"
gsettings set org.gnome.shell.extensions.desktop-icons show-home "false"
gsettings set org.gnome.shell.extensions.desktop-icons show-trash "false"

gsettings set org.gnome.desktop.interface icon-theme "Yaru-prussiangreen"
gsettings set org.gnome.desktop.interface cursor-theme "Yaru"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-prussiangreen-dark"
gsettings set org.gnome.desktop.interface enable-animations "false"
gsettings set org.gnome.desktop.sound event-sounds "false"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.shell.ubuntu color-scheme 'prefer-dark'

gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/Optical_Fibers_in_Dark_by_Elena_Stravoravdi.jpg'
gsettings set org.gnome.desktop.background color-shading-type 'solid'
gsettings set org.gnome.desktop.background picture-options 'zoom'
gsettings set org.gnome.desktop.screensaver color-shading-type 'solid'
gsettings set org.gnome.desktop.screensaver picture-options 'zoom'

gsettings set org.gnome.desktop.interface monospace-font-name "Meslo LG S for Powerline 13"
gsettings set org.gnome.desktop.interface font-name "Garuda 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Garuda Bole 12"
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

gsettings set org.gnome.mutter workspaces-only-on-primary "false"

git clone git://github.com/spin83/multi-monitors-add-on.git
mkdir -p ~/.local/share/gnome-shell/extensions/
cp -r multi-monitors-add-on/multi-monitors-add-on@spin83 ~/.local/share/gnome-shell/extensions/
rm -Rf multi-monitors-add-on

gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed "false"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "RIGHT"
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com

dconf load /org/gnome/desktop/wm/keybindings/ < $HOME/zetup/ui/window-keybindings.conf
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < $HOME/zetup/ui/launcher-keybindings.conf

sudo apt install -y uuid

getDefaultTerminal()
{
  profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
  profile=${profile:1:-1} # remove leading and trailing single quotes
  echo $profile
}

getTerminalSetting()
{
  terminalSetting="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$1/"
  echo $terminalSetting
}

themeTerminal()
{
  # Setup terminal
  terminalSetting=$(getTerminalSetting $1)
  gsettings set $terminalSetting default-size-columns 120
  gsettings set $terminalSetting default-size-rows 25
  gsettings set $terminalSetting use-system-font "false"
  gsettings set $terminalSetting font "Meslo LG S for Powerline 13"
  dconf write /org/gnome/terminal/legacy/theme-variant "'dark'"
  dconf write /org/gnome/terminal/legacy/new-terminal-mode "'tab'"

  gsettings set $terminalSetting visible-name $2
  gsettings set $terminalSetting background-color "#1d1d1f1f2121"
  gsettings set $terminalSetting foreground-color "#b8b8dbdbefef"
  gsettings set $terminalSetting cursor-background-color "#b8b8dbdbefef"
  gsettings set $terminalSetting cursor-foreground-color "#1d1d1f1f2121"
  gsettings set $terminalSetting bold-color "#b8b8dbdbefef"
  gsettings set $terminalSetting bold-color-same-as-fg "true"
  gsettings set $terminalSetting use-theme-colors "false"
  gsettings set $terminalSetting use-theme-background "false"
  gsettings set $terminalSetting allow-bold "true"
  gsettings set $terminalSetting encoding "UTF-8"
  gsettings set $terminalSetting palette "['#1d1d1d1d1919', '#f1f183833939', '#9f9fd3d36464', '#f4f4efef6d6d', '#50509696bebe', '#69695a5abcbc', '#d6d638386565', '#ffffffffffff', '#1d1d1d1d1919', '#d2d22a2a2424', '#a7a7d4d42c2c', '#ffff89894949', '#6161b9b9d0d0', '#69695a5abcbc', '#d6d638386565', '#ffffffffffff']"
  gsettings set $terminalSetting audible-bell "false"
}

copyTerminal()
{
  newProfileId=$(uuid)
  quotedProfileId="'$newProfileId'"
  allProfiles=$(gsettings get org.gnome.Terminal.ProfilesList list)
  allProfiles="${allProfiles/]/, $quotedProfileId]}"

  sourceTerminal=$(getTerminalSetting $1)
  destinationTerminal=$(getTerminalSetting $newProfileId)

  for i in $(gsettings list-keys $sourceTerminal);
  do
    value=$(gsettings get $sourceTerminal $i)
    gsettings set $destinationTerminal $i "$value"
  done

  gsettings set $destinationTerminal visible-name "'$2'"
  gsettings set org.gnome.Terminal.ProfilesList list "$allProfiles"

  echo $newProfileId
}

defaultProfile=$(getDefaultTerminal)
themeTerminal $defaultProfile 'Bash'

# Initialize PowerShell terminal profile
pwshProfile=$(copyTerminal $defaultProfile 'PowerShell')
pwshSetting=$(getTerminalSetting $pwshProfile)
gsettings set $pwshSetting use-custom-command true
gsettings set $pwshSetting custom-command "'pwsh'"

# Initialize Conda terminal profile
condaProfile=$(copyTerminal $defaultProfile 'Conda')
condaSetting=$(getTerminalSetting $condaProfile)
gsettings set $condaSetting use-custom-command true
gsettings set $condaSetting custom-command "'bash --rcfile ~/.conda_bashrc'"

# Fixes occasional hangs
# See https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1798961
sudo apt remove -y xserver-xorg-video-intel
