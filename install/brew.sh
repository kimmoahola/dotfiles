if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

if ! is-executable brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

# Install packages

apps=(
  bash-completion2
  bats
  coreutils
  diff-so-fancy
  ffmpeg
  git
  git-extras
  gnu-tar --with-default-names
  gnu-sed --with-default-names
  grep --with-default-names
  htop
  httpie
  jq
  nano
  peco
  python
  screen
  shellcheck
  ssh-copy-id
  tree
  unar
  wget --with-iri
)

brew install "${apps[@]}"

brew cleanup

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

export DOTFILES_BREW_PREFIX_GNU_SED=`brew --prefix gnu-sed`
set-config "DOTFILES_BREW_PREFIX_GNU_SED" "$DOTFILES_BREW_PREFIX_GNU_SED" "$DOTFILES_CACHE"

export DOTFILES_BREW_PREFIX_GNU_TAR=`brew --prefix gnu-tar`
set-config "DOTFILES_BREW_PREFIX_GNU_TAR" "$DOTFILES_BREW_PREFIX_GNU_TAR" "$DOTFILES_CACHE"

export DOTFILES_BREW_PREFIX=`brew --prefix`
set-config "DOTFILES_BREW_PREFIX" "$DOTFILES_BREW_PREFIX" "$DOTFILES_CACHE"
