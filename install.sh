#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.fish"
DOTFILES_EXTRA_DIR="$HOME/.dotfiles_extra"

rm -f "$DOTFILES_CACHE"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Backup

STAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DEST="$DOTFILES_DIR/backup/$STAMP/"
mkdir -p "$BACKUP_DEST"

[ -f "$HOME/.gitconfig" ] && cp "$HOME/.gitconfig" "$BACKUP_DEST"
[ -f "$HOME/.gitignore_global" ] && cp "$HOME/.gitignore_global" "$BACKUP_DEST"
[ -f "$HOME/.config/htop/htoprc" ] && cp "$HOME/.config/htop/htoprc" "$BACKUP_DEST"
[ -f "$HOME/.config/fish/config.fish" ] && cp "$HOME/.config/fish/config.fish" "$BACKUP_DEST"
[ -f "$HOME/Library/Application Support/Code/User/settings.json" ] && cp "$HOME/Library/Application Support/Code/User/settings.json" "$BACKUP_DEST"

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/configs/.gitconfig" "$HOME"
ln -sfv "$DOTFILES_DIR/configs/.gitignore_global" "$HOME"

mkdir -p "$HOME/.config/fish"
ln -sfv "$DOTFILES_DIR/configs/config.fish" "$HOME/.config/fish"

mkdir -p "$HOME/.config/htop"
ln -sfv "$DOTFILES_DIR/configs/htoprc" "$HOME/.config/htop"

if is-macos; then
  mkdir -p "$HOME/Library/Application Support/Code/User"
  ln -sfv "$DOTFILES_DIR/configs/vscode.json" "$HOME/Library/Application Support/Code/User/settings.json"
fi

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/npm.sh"
. "$DOTFILES_DIR/install/bash.sh"
. "$DOTFILES_DIR/install/fish.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# # MacOS defaults

# . "${DOTFILES_DIR}/install/defaults.macos.sh"

# Install extra stuff

if [ -d "$DOTFILES_EXTRA_DIR" ] && [ -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
  echo "applying $DOTFILES_EXTRA_DIR/install.sh"
  . "$DOTFILES_EXTRA_DIR/install.sh"
fi

echo
echo "Lastly run 'curl -L https://get.oh-my.fish | fish' in this shell. And then open a new shell and run 'omf install bobthefish'"
echo
echo "Some changes may require a restart to take effect."
echo
