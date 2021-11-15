#!/usr/bin/env bash

if is-macos; then
  grep "/usr/local/bin/fish" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/fish >> /private/etc/shells"
  chsh -s /usr/local/bin/fish
fi

if is-ubuntu; then
  chsh -s /usr/bin/fish
fi

# Fisher package manager
if ! [ -f $HOME/.config/fish/functions/fisher.fish ]; then
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fi

fish -c "fisher update"
