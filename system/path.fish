
# Prepend new items to path (if directory exists)

prepend-path "/bin"
prepend-path "/usr/bin"
prepend-path "/usr/local/bin"
prepend-path "$DOTFILES_BREW_PREFIX_COREUTILS/libexec/gnubin"
prepend-path "$DOTFILES_BREW_PREFIX_GNU_SED/bin"
prepend-path "$DOTFILES_BREW_PREFIX_GNU_TAR/bin"
prepend-path "$DOTFILES_DIR/bin"
prepend-path "$HOME/bin"
prepend-path "/sbin"
prepend-path "/usr/sbin"
prepend-path "/usr/local/sbin"

set -g -x MANPATH $DOTFILES_BREW_PREFIX_COREUTILS/libexec/gnuman $MANPATH
