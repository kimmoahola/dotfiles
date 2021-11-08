#!/usr/bin/env bash

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

# Run this so we can run fnm right now without opening a new shell
export PATH="~/.fnm:$PATH"
eval "$(fnm env)"

fnm install 16
fnm alias default 16
fnm use default
