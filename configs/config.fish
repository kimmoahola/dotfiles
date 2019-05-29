# set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"

set -x -g TERM "xterm-256color"

# If not running interactively, don't do anything

if not status is-interactive
  exit
end

# Resolve DOTFILES_DIR (assuming ~/.dotfiles)

if test -d $HOME/.dotfiles
  set DOTFILES_DIR "$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  exit
end

# Make utilities available

#if status is-login
  set -x -g PATH $DOTFILES_DIR/bin $PATH
#end

# Read cache

set DOTFILES_CACHE $DOTFILES_DIR/.cache.fish
test -f "$DOTFILES_CACHE"; and source "$DOTFILES_CACHE"

# Source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/{function,function_*,path,env,alias,completion,nvm,pyenv}.fish
  test -f "$DOTFILE"; and source $DOTFILE
end

if is-macos
  for DOTFILE in "$DOTFILES_DIR"/system/{function,env,alias}.macos.fish
    test -f $DOTFILE; and source $DOTFILE
  end
end

# Hook for extra/custom stuff

set DOTFILES_EXTRA_DIR $HOME/.dotfiles_extra

if test -d $DOTFILES_EXTRA_DIR
  for EXTRAFILE in "$DOTFILES_EXTRA_DIR"/runcom/*.fish
    test -f $EXTRAFILE; and source $EXTRAFILE
  end
end
