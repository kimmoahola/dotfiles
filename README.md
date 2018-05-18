# My dotfiles

These are my dotfiles. Installation script will install various software and setup the shell to be my style. Also some macOS settings are modified.

It targets macOS systems, but it may work on *nix as well.

## Package overview

* Core
  * Fish shell + [coreutils](https://en.wikipedia.org/wiki/GNU_Core_Utilities)
  * [Homebrew](https://brew.sh) + [homebrew-cask](https://caskroom.github.io)
  * Node.js + npm
  * GNU [sed](https://www.gnu.org/software/sed/), [grep](https://www.gnu.org/software/grep/), [Wget](https://www.gnu.org/software/wget/)
  * [spot](https://github.com/guille/spot), [tree](http://mama.indstate.edu/users/ice/tree/), [htop](https://github.com/hishamhm/htop)
  * Git + [SourceTree](https://www.sourcetreeapp.com)
  * Python 2
* Development (Node/JS/JSON): [jq](https://stedolan.github.io/jq), [nodemon](https://nodemon.io), [peco](https://peco.github.io), [superstatic](https://github.com/firebase/superstatic), [underscore-cli](https://github.com/ddopson/underscore-cli)
* macOS: [Quick Look plugins](https://github.com/sindresorhus/quick-look-plugins)
* [macOS apps](https://github.com/kimmoahola/dotfiles/blob/master/install/brew-cask.sh)
* [macOS settings](https://github.com/kimmoahola/dotfiles/blob/master/install/defaults.macos.sh)

## Install

:warning: Don't just run these files without first reviewing the code and removing stuff you don't need/want. Running the installation script may break your system. Use at your own risk!

On a sparkling fresh installation of macOS, first **install all OS updates** and then

    xcode-select --install

Install the dotfiles with either Git or curl/wget:

### Clone with Git

    git clone https://github.com/kimmoahola/dotfiles.git ~/.dotfiles
    source ~/.dotfiles/install.sh

### Remotely install using curl

Alternatively, you can install this into `~/.dotfiles` remotely without Git using curl:

    bash -c "`curl -fsSL https://raw.github.com/kimmoahola/dotfiles/fish/remote-install.sh`"

Or, using wget:

    bash -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/kimmoahola/dotfiles/fish/remote-install.sh`"

The instalation is designed to be idempotent, meaning it can be run again.

### Install oh-my-fish and the theme

Open a new shell and run `curl -L https://get.oh-my.fish | fish` and `omf install bobthefish`

### Install powerline font

For example the Noto Mono for Powerline from https://github.com/powerline/fonts

### Adjust iTerm settings

1. Select the powerline font 14pt and same font for non-ASCII text but 13pt.
2.

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>

    Commands:
    clean            Clean up caches (brew, npm)
    help             This help message
    update           Update packages and pkg managers (brew, brew cask, npm)

## Customize/extend

Custom installation step can be put into `$HOME/.dotfiles_extra/install.sh`. That will be sourced last in the installation.

`$HOME/.dotfiles_extra/runcom/*.sh` will be sources from `.bash_profile`. You can put your custom settings, such as credentials in there.

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
