#!/usr/bin/env bash

if is-macos; then
  if ! is-executable brew; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  brew upgrade

  # Install packages

  apps=(
    ansible
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

  apps_to_remove=(
    ubuntu-web-launchers
    thunderbird
  )

  sudo apt-get remove --purge --assume-yes "${apps_to_remove[@]}"

  apps=(
    ansible
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
    pipenv
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
fi

# pyenv
curl https://pyenv.run | bash

# Disable pipenv prompt
set-config "VIRTUAL_ENV_DISABLE_PROMPT" "1" "$DOTFILES_CACHE"
