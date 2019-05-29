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

set +x

