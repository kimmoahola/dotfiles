#!/usr/bin/env bash

if is-macos; then
  grep "/usr/local/bin/fish" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/fish >> /private/etc/shells"
  chsh -s /usr/local/bin/fish
fi

if is-ubuntu; then
  chsh -s /usr/bin/fish
fi

# Fisher package manager
if ! [ -f ~/.config/fish/functions/fisher.fish ]; then
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fi

fish -c fisher
