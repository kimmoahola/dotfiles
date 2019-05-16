# Prefer US English and use UTF-8

set -x -g LC_ALL "en_US.UTF-8"
set -x -g LANG "en_US.UTF-8"

# Highlight section titles in man pages

set -x -g LESS_TERMCAP_md $yellow

# Keep showing man page after exit

set -x -g MANPAGER "less -X"

set -x -g PAGER less

set -x -g EDITOR "code --wait"
set -x -g DOTFILES_IDE "code"
set -x -g DOTFILES_GIT_GUI "stree"
