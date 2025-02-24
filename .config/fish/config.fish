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

set -x -g PATH $DOTFILES_DIR/bin $PATH

set -g -x DOTFILES_BREW_PREFIX_COREUTILS "/opt/homebrew/opt/coreutils"
set -g -x DOTFILES_BREW_PREFIX_GNU_SED "/opt/homebrew/opt/gnu-sed"
set -g -x DOTFILES_BREW_PREFIX_GNU_TAR "/opt/homebrew/opt/gnu-tar"
set -g -x DOTFILES_BREW_PREFIX_GNU_GREP "/opt/homebrew/opt/grep"
set -g -x DOTFILES_BREW_PREFIX "/opt/homebrew"


function prepend-path
  if test -d $argv
    if status is-interactive
      set -x -g PATH $argv $PATH
    end
  end
end

function calc
  echo $argv | bc -l
end

# Usage:
# cheat tar~list
function cheat
  curl cheat.sh/"$argv"
end

function clean-docker
  docker ps -a | grep 'hours ago' | awk '{print $1}' | xargs docker rm
  docker ps -a | grep '.. minutes ago' | awk '{print $1}' | xargs docker rm
  docker ps -q -a -f status=exited | xargs -n 100 docker rm -v
  docker images -q --filter "dangling=true" | xargs -n 100 docker rmi
  docker images | grep "^<none>" | awk '{print $3}' | xargs docker rmi
end

# Fuzzy find file/dir
function ff
  find . -type f -iname "$argv"
end
function fff
  find . -type f -iname "*$argv*"
end
function fd
  find . -type d -iname "$argv"
end
function fdf
  find . -type d -iname "*$argv*"
end


# Prepend new items to path (if directory exists)

set -g -x DOTFILES_BREW_PREFIX_COREUTILS "/opt/homebrew/opt/coreutils"
set -g -x DOTFILES_BREW_PREFIX_GNU_SED "/opt/homebrew/opt/gnu-sed"
set -g -x DOTFILES_BREW_PREFIX_GNU_TAR "/opt/homebrew/opt/gnu-tar"
set -g -x DOTFILES_BREW_PREFIX_GNU_GREP "/opt/homebrew/opt/grep"
set -g -x DOTFILES_BREW_PREFIX "/opt/homebrew"

prepend-path "/bin"
prepend-path "/usr/bin"
prepend-path "/usr/local/bin"
prepend-path "$DOTFILES_BREW_PREFIX_COREUTILS/libexec/gnubin"
prepend-path "$DOTFILES_BREW_PREFIX_GNU_SED/libexec/gnubin"
prepend-path "$DOTFILES_BREW_PREFIX_GNU_TAR/libexec/gnubin"
prepend-path "$DOTFILES_BREW_PREFIX_GNU_GREP/libexec/gnubin"
prepend-path "$DOTFILES_DIR/bin"
prepend-path "$HOME/bin"
prepend-path "/sbin"
prepend-path "/usr/sbin"
prepend-path "/usr/local/sbin"
prepend-path "/opt/homebrew/opt/openjdk@17/bin"
prepend-path "/opt/homebrew/bin"
prepend-path "/opt/homebrew/opt/node@20/bin"
prepend-path "/opt/homebrew/opt/curl/bin"

set -g -x MANPATH \
  $DOTFILES_BREW_PREFIX_COREUTILS/libexec/gnuman \
  $DOTFILES_BREW_PREFIX_GNU_SED/libexec/gnuman \
  $DOTFILES_BREW_PREFIX_GNU_TAR/libexec/gnuman \
  $DOTFILES_BREW_PREFIX_GNU_GREP/libexec/gnuman \
  $MANPATH

# Prefer US English and use UTF-8

set -x -g LC_ALL "en_US.UTF-8"
set -x -g LANG "en_US.UTF-8"

# Highlight section titles in man pages

set -x -g LESS_TERMCAP_md $yellow

# Keep showing man page after exit

set -x -g MANPAGER "less -X"

set -x -g PAGER less

#set -x -g EDITOR "code --wait"
set -x -g EDITOR "nvim"

set -x -g XDG_CONFIG_HOME "$HOME/.config"


# Shortcuts

alias g="git"
alias lg="lazygit"

alias rr="rm -rf"

# Default options

alias rsync="rsync -vh"
alias json="json -c"
alias psgrep="psgrep -i"
alias less="less -R"

# Directory listing/traversal

alias l="eza --long --header --git --classify --icons --group-directories-first --binary"
alias la="l --all"

alias ...="cd ../.."
alias ....="cd ../../.."

alias tree="tree -A"
alias treed="tree -d"
alias tree1="tree -d -L 1"
alias tree2="tree -d -L 2"

# npm

alias ni="npm install"
alias nu="npm uninstall"
alias nup="npm update"
alias nri="rm -r node_modules; and npm install"
alias ncd="npm-check -su"

# Network

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Miscellaneous

alias week="date +%V"
alias psql='env PAGER="less -S" psql'


set -x PYENV_ROOT $HOME/.pyenv
prepend-path "$PYENV_ROOT/bin"

if status is-interactive
  pyenv init --path | source
  pyenv init - | source
end

if is-macos
  # For pyenv to be able to build python versions
  set -x -g LDFLAGS "-L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl/lib" $LDFLAGS
  set -x -g CPPFLAGS "-I/usr/local/opt/zlib/include -I/usr/local/opt/openssl/include" $CPPFLAGS
end

set -x -g CPPFLAGS "-I/opt/homebrew/opt/openjdk@17/include" $CPPFLAGS




if is-macos
  # Raise limit for open files and processes
  ulimit -S -n 8192

  # Copy pwd to clipboard
  alias cpwd="pwd|tr -d '\n'|pbcopy"

  # Recursively remove Apple meta files
  alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
  alias cleanupad="find . -type d -name '.AppleD*' -ls -delete"

end

starship init fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
