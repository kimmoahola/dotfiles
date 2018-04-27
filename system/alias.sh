# Shortcuts

alias reload="source ~/.bash_profile"
alias _="sudo"

alias g="git"
# auto-complete for alias 'g' also
complete -o default -o nospace -F _git g

alias rr="rm -rf"

# Default options

alias rsync="rsync -vh"
alias json="json -c"
alias psgrep="psgrep -i"
alias less="less -R"

# List declared aliases, functions, paths

alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'

# Directory listing/traversal

LS_COLORS=`is-supported "ls --color" --color -G`
LS_TIMESTYLEISO=`is-supported "ls --time-style=long-iso" --time-style=long-iso`
LS_GROUPDIRSFIRST=`is-supported "ls --group-directories-first" --group-directories-first`

alias l="ls -lahA $LS_COLORS $LS_TIMESTYLEISO $LS_GROUPDIRSFIRST"
alias ll="ls -lA $LS_COLORS $LS_TIMESTYLEISO $LS_GROUPDIRSFIRST"
alias lt="ls -lhAtr $LS_COLORS $LS_TIMESTYLEISO $LS_GROUPDIRSFIRST"
alias ld="ls -ld $LS_COLORS $LS_TIMESTYLEISO */"
alias lpm="stat -c '%a %n' *"

unset LS_COLORS LS_TIMESTYLEISO LS_GROUPDIRSFIRST

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"                  # Go to previous dir with -
alias cd.='cd $(readlink -f .)'    # Go to real dir (i.e. if current dir is linked)

alias tree="tree -A"
alias treed="tree -d"
alias tree1="tree -d -L 1"
alias tree2="tree -d -L 2"

# npm

alias ni="npm install"
alias nu="npm uninstall"
alias nup="npm update"
alias nri="rm -r node_modules && npm install"
alias ncd="npm-check -su"

# Network

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Miscellaneous

alias hosts="sudo $EDITOR /etc/hosts"
alias his="historie"
alias week="date +%V"
alias speedtest="wget -O /dev/null http://speed.transip.nl/100mb.bin"
alias psql='PAGER="less -S" psql'
