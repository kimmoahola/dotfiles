#!/usr/bin/env bash

if is-macos; then
  if ! is-executable brew; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  brew upgrade

  # Install packages

  apps=(
    bats
    coreutils
    ffmpeg
    findutils
    fish
    git
    git-extras
    gnu-tar
    gnu-sed
    grep
    htop
    httpie
    jq
    nano
    peco
    pipenv
    pyenv
    python
    screen
    shellcheck
    ssh-copy-id
    tree
    unar
    wget
  )

  brew install "${apps[@]}"

  brew cleanup

  export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
  set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

  export DOTFILES_BREW_PREFIX_GNU_SED=`brew --prefix gnu-sed`
  set-config "DOTFILES_BREW_PREFIX_GNU_SED" "$DOTFILES_BREW_PREFIX_GNU_SED" "$DOTFILES_CACHE"

  export DOTFILES_BREW_PREFIX_GNU_TAR=`brew --prefix gnu-tar`
  set-config "DOTFILES_BREW_PREFIX_GNU_TAR" "$DOTFILES_BREW_PREFIX_GNU_TAR" "$DOTFILES_CACHE"

  export DOTFILES_BREW_PREFIX_GNU_GREP=`brew --prefix grep`
  set-config "DOTFILES_BREW_PREFIX_GNU_GREP" "$DOTFILES_BREW_PREFIX_GNU_GREP" "$DOTFILES_CACHE"

  export DOTFILES_BREW_PREFIX=`brew --prefix`
  set-config "DOTFILES_BREW_PREFIX" "$DOTFILES_BREW_PREFIX" "$DOTFILES_CACHE"

fi

if is-ubuntu; then

  apps=(
    build-essential
    coreutils
    curl
    findutils
    fish
    git
    git-extras
    grep
    htop
    httpie
    jq
    nano
    peco
    python
    python-pip
    screen
    sed
    shellcheck
    tar
    tree
    unar
    wget
  )

  sudo apt-get update
  sudo apt-get --assume-yes install "${apps[@]}"

  # pipenv
  pip install --user pipenv

  # pyenv
  curl https://pyenv.run | bash

fi

# Disable pipenv prompt
set-config "VIRTUAL_ENV_DISABLE_PROMPT" "1" "$DOTFILES_CACHE"
