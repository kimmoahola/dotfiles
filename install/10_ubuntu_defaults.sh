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
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/foreground-color "'rgb(226,228,223)'"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/background-color "'rgb(27,29,34)'"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/bold-color-same-as-fg false
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/bold-color "'rgb(255,255,255)'"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/palette "['rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/use-theme-colors false
dconf write /org/gnome/terminal/legacy/profiles:/:$profile/use-theme-transparency false
dconf write /org/gnome/terminal/legacy/theme-variant "'dark'"

dconf write /org/gnome/desktop/peripherals/keyboard/repeat-interval 25
dconf write /org/gnome/desktop/peripherals/keyboard/delay 200

dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'firefox.desktop', 'org.gnome.Terminal.desktop', 'code_code.desktop']"

dconf write /org/gtk/settings/file-chooser/show-hidden true

set +x
