#!/usr/bin/env bash

if is-macos; then
  # Install packages

  apps=(
    bat
    borkdude/brew/jet  # CLI to transform between JSON, EDN, YAML and Transit
    clojure
    colima
    coreutils
    curl
    docker
    docker-buildx
    docker-compose
    docker-credential-helper
    entr
    eza
    fd
    ffmpeg
    findutils
    fish
    git-delta
    git-extras
    gnu-sed
    gnu-tar
    grep
    htop
    httpie
    jless
    jq
    just
    lazygit
    mise
    multitime
    nano
    peco
    screen
    shellcheck
    siege
    ssh-copy-id
    stern
    tree
    unar
    watch
    wget
    zoxide
  )

  brew install "${apps[@]}"

  brew cleanup

  ln -svf /opt/homebrew/bin/docker-compose ~/.docker/cli-plugins/docker-compose
  ln -svf /opt/homebrew/bin/docker-buildx ~/.docker/cli-plugins/docker-buildx
fi

if is-ubuntu; then

  apps_to_remove=(
    thunderbird
  )

  for app in "${apps_to_remove[@]}"; do
    sudo apt-get remove --purge --assume-yes "${app}"
  done

  apps=(
    bat
    build-essential
    ca-certificates
    coreutils
    curl
    eza
    findutils
    fish
    git-extras
    grep
    htop
    httpie
    jq
    nano
    net-tools
    peco
    screen
    sed
    shellcheck
    siege
    tar
    tree
    unar
    wget
  )

  sudo apt-get update

  for app in "${apps[@]}"; do
    sudo apt-get --assume-yes install "${app}"
  done
fi
