# Shortcuts

alias _="sudo"

alias g="git"

alias rr="rm -rf"

# Default options

alias rsync="rsync -vh"
alias json="json -c"
alias psgrep="psgrep -i"
alias less="less -R"

# List declared aliases, functions, paths

# alias aliases="alias | sed 's/=.*//'"
# alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{\$//'"
# alias paths='echo -e ${PATH//:/\\n}'

# Directory listing/traversal

set LS_COLORS "--color -G"
set LS_TIMESTYLEISO "--time-style=long-iso"
set LS_GROUPDIRSFIRST "--group-directories-first"

alias l="ls -lahA $LS_COLORS $LS_TIMESTYLEISO $LS_GROUPDIRSFIRST"
alias ll="ls -lA $LS_COLORS $LS_TIMESTYLEISO $LS_GROUPDIRSFIRST"
alias lt="ls -lhAtr $LS_COLORS $LS_TIMESTYLEISO $LS_GROUPDIRSFIRST"
alias ld="ls -ld $LS_COLORS $LS_TIMESTYLEISO */"

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
alias speedtest="wget -O /dev/null http://speed.transip.nl/100mb.bin"
alias psql='env PAGER="less -S" psql'
