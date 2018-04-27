# Copy pwd to clipboard

alias cpwd="pwd|tr -d '\n'|pbcopy"

# Shortcuts

alias gg="$DOTFILES_GIT_GUI"

# Recursively remove Apple meta files

alias cleanupds="find . -type f -name '*.DS_Store' -ls -exec /bin/rm {} \;"
alias cleanupad="find . -type d -name '.AppleD*' -ls -exec /bin/rm -r {} \;"
