#!/usr/bin/env bash

if is-macos; then
  # Install packages

  apps=(
    bat
    borkdude/brew/jet  # CLI to transform between JSON, EDN, YAML and Transit
    clojure
    coreutils
    curl
    entr
    eza
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
    multitime
    nano
    node@20
    openjdk@17
    peco
    screen
    shellcheck
    siege
    ssh-copy-id
    TomAnthony/brews/itermocil
    tree
    unar
    watch
    wget
    zlib  # for pyenv to be able to build python versions
  )

  brew install "${apps[@]}"

  brew cleanup

  # For the system Java wrappers to find this JDK, symlink it with
  sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
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

    # These packages are for pyenv to be able to build python versions
    libbz2-dev
    libffi-dev
    liblzma-dev
    libncurses5-dev
    libncursesw5-dev
    libreadline-dev
    libsqlite3-dev
    libssl-dev
    llvm
    make
    python-openssl
    tk-dev
    xz-utils
    zlib1g-dev
  )

  sudo apt-get update

  for app in "${apps[@]}"; do
    sudo apt-get --assume-yes install "${app}"
  done
fi

# pyenv
if ! [ -d "$HOME/.pyenv" ]; then
  curl https://pyenv.run | bash
fi
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
