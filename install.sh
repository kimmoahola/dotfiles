#!/usr/bin/env bash
set -euo pipefail

echo "Asking sudo password..."

# Ask for the administrator password upfront
sudo -v

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

for file in "$DOTFILES_DIR"/install/*; do
  . $file
done

echo
echo "Some changes may require a restart to take effect."
echo
