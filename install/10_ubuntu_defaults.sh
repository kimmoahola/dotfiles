#!/usr/bin/env bash

if ! is-ubuntu; then
  return
fi

# Echo commands
set -x

profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1} # remove leading and trailing single quotes
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/font "'Noto Mono for Powerline 10'"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/use-system-font false

dconf write /org/gnome/terminal/legacy/theme-variant "'dark'"

dconf write /org/gnome/desktop/peripherals/keyboard/repeat-interval 25
dconf write /org/gnome/desktop/peripherals/keyboard/delay 200

dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'firefox.desktop', 'org.gnome.Terminal.desktop', 'code_code.desktop']"

dconf write /org/gtk/settings/file-chooser/show-hidden true

set +x
