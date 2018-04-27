#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.dotfiles_extra"

rm -f "$DOTFILES_CACHE"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Backup

STAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DEST="$DOTFILES_DIR/backup/$STAMP/"
mkdir -p "$BACKUP_DEST"

[ -f "$DOTFILES_DIR/runcom/.bash_profile" ] && cp "$DOTFILES_DIR/runcom/.bash_profile" "$BACKUP_DEST"
[ -f "$DOTFILES_DIR/configs/.gitconfig" ] && cp "$DOTFILES_DIR/configs/.gitconfig" "$BACKUP_DEST"
[ -f "$DOTFILES_DIR/configs/.gitignore_global" ] && cp "$DOTFILES_DIR/configs/.gitignore_global" "$BACKUP_DEST"
[ -f "$DOTFILES_DIR/configs/htoprc" ] && cp "$DOTFILES_DIR/configs/htoprc" "$BACKUP_DEST"

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" "$HOME"
ln -sfv "$DOTFILES_DIR/configs/.gitconfig" "$HOME"
ln -sfv "$DOTFILES_DIR/configs/.gitignore_global" "$HOME"

mkdir -p "$HOME/.config/htop"
ln -sfv "$DOTFILES_DIR/configs/htoprc" "$HOME/.config/htop"

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/npm.sh"
. "$DOTFILES_DIR/install/bash.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# MacOS defaults

. "${DOTFILES_DIR}/install/defaults.macos.sh"

# Run tests

if is-executable bats; then bats $DOTFILES_DIR/test/*.bats; else echo "Skipped: tests (missing: bats)"; fi

# Install extra stuff

if [ -d "$DOTFILES_EXTRA_DIR" ] && [ -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
  echo "applying $DOTFILES_EXTRA_DIR/install.sh"
  . "$DOTFILES_EXTRA_DIR/install.sh"
fi

echo "Done. Some changes may require a restart to take effect."
