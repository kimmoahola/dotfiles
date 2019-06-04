#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Run these so we can run nvm right now without opening a new shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install 10
nvm alias default 10
nvm use default

# Globally install with npm
packages=(
  diff-so-fancy
  eslint
  eslint-config-airbnb-base
  eslint-config-prettier
  eslint-plugin-import
  get-port-cli
  nodemon
  prettier
  release-it
  spot
  superstatic
  svgo
  tldr
  underscore-cli
)

npm install -g "${packages[@]}"

npm cache clean --force
