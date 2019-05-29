#!/usr/bin/env bash

if is-macos; then
  brew tap caskroom/cask
  brew tap buo/cask-upgrade

  # Install packages

  apps=(
    docker
    firefox
    google-chrome
    google-chrome-canary
    insomnia
    iterm2
    skitch
    spectacle
    spotify
    tunnelblick
    virtualbox
    visual-studio-code
  )

  brew cask install "${apps[@]}"

  # Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
  quick_look_apps=(
    qlcolorcode
    qlstephen
    qlmarkdown
    quicklook-json
    qlimagesize
    webpquicklook
    suspicious-package
    qlvideo
  )

  brew cask install "${quick_look_apps[@]}"

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
    virtualbox
  )

  sudo apt-get --assume-yes install "${apps[@]}"

  sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

  snap_apps=(
    insomnia
    spotify
  )

  for app in "${snap_apps[@]}"; do
	  sudo snap install "${app}"
  done

  sudo snap install code --classic
fi
