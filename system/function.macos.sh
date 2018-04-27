# Open man page as PDF

manpdf() {
  man -t "$1" | open -f -a /Applications/Preview.app/
}

# Dev

d() {
  $DOTFILES_IDE ${1:-.}
  $DOTFILES_GIT_GUI ${1:-.}
}
