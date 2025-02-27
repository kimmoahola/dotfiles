#!/usr/bin/env bash

if is-macos; then
  brew tap buo/cask-upgrade

  # Install packages

  apps=(
    firefox
    font-hack-nerd-font
    handbrake
    insomnia
    iterm2
    maccy
    orbstack
    raycast
    spotify
    stats
    tabby
    visual-studio-code
  )

  for app in "${apps[@]}"; do
    brew info --cask "${app}" | grep "Not installed" &>/dev/null && brew install --cask "${app}"
  done
fi

if is-ubuntu; then

  # docker depencencies
  sudo apt-get --assume-yes install \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update

  apps=(
    chromium-browser
    docker-ce
    docker-ce-cli
    firefox
    handbrake
    virtualbox
  )

  for app in "${apps[@]}"; do
    sudo apt-get --assume-yes install "${app}"
  done

  DOCKER_COMPOSE_VERSION="1.26.0"
  if ! [ -f /usr/local/bin/docker-compose-$DOCKER_COMPOSE_VERSION ]; then
    sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose-$DOCKER_COMPOSE_VERSION
  fi
  sudo chmod +x /usr/local/bin/docker-compose-$DOCKER_COMPOSE_VERSION
  sudo ln -sfv /usr/local/bin/docker-compose-$DOCKER_COMPOSE_VERSION /usr/local/bin/docker-compose

  snap_apps=(
    insomnia
    spotify
  )

  for app in "${snap_apps[@]}"; do
	  sudo snap install "${app}"
  done

  sudo snap install code --classic
fi
