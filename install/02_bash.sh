#!/usr/bin/env bash

if is-macos; then
  brew install bash
  grep "/usr/local/bin/bash" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
fi

if is-ubuntu; then
  sudo apt-get --assume-yes install bash
fi
