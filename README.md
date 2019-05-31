# My dotfiles

These are my dotfiles. Installation script will install various software and setup the shell to be my style. Also some Ubuntu and macOS settings are modified.

It targets Ubuntu and macOS systems. Last tested on Ubuntu 19.04 and macOS 10.14.

## Package overview

- Fish shell with [functions and aliases](system)
- [Various system packages](install/01_packages.sh) installed with brew or apt-get
- [Various npm packages](install/02_npm.sh)
- [Various desktop packages](install/03_desktop_packages.sh)
- [Configs for some programs](configs)

## Install

:warning: Don't just run these files without first reviewing the code and removing stuff you don't need/want. Running the installation script may break your system. Use at your own risk!

The instalation is designed to be idempotent, meaning it can be run again.

First **install all OS updates**.

On a sparkling fresh installation of macOS

    xcode-select --install

Install fonts.

The Noto Mono for Powerline from https://github.com/powerline/fonts/raw/master/NotoMono/Noto%20Mono%20for%20Powerline.ttf

The Input font from: http://input.fontbureau.com/build/?fontSelection=fourStyleFamily&regular=InputSansNarrow-Light&italic=InputSansNarrow-LightItalic&bold=InputSansNarrow-Medium&boldItalic=InputSansNarrow-MediumItalic&a=0&g=ss&i=0&l=0&zero=0&asterisk=height&braces=straight&preset=default&line-height=1&accept=I+do&email=

Install the dotfiles with either Git or curl/wget:

### Clone with Git

    git clone https://github.com/kimmoahola/dotfiles.git ~/.dotfiles
    bash ~/.dotfiles/install.sh

### Remotely install using curl

Alternatively, you can install this into `~/.dotfiles` remotely without Git using curl:

    bash -c "`curl -fsSL https://raw.github.com/kimmoahola/dotfiles/master/remote-install.sh`"

Or, using wget:

    bash -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/kimmoahola/dotfiles/master/remote-install.sh`"

### Install oh-my-fish and the theme

Open a new shell and run `curl -L https://get.oh-my.fish | fish` and `omf install bobthefish`

### Add ssh key to github

`cat $HOME/.ssh/id_rsa.pub`

https://github.com/settings/keys

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>

    Commands:
    clean            Clean up caches (brew, npm)
    help             This help message
    update           Update packages and pkg managers (brew, brew cask, npm)

## Customize/extend

Custom installation step can be put into `$HOME/.dotfiles_extra/install.sh`. That will be sourced last in the installation.

`$HOME/.dotfiles_extra/runcom/*.fish` will be sources from `config.fish`. You can put your custom settings, such as credentials in there.

## Upgrading to newer Ubuntu

- Check that docker-ce is available for the newer Ubuntu.
- Rename any 3rd party sources in `/etc/apt/sources.list` to point to the newer Ubuntu release.
- After the upgrade, run install.sh and check the results.

## Upgrading to newer macOS

- After the upgrade, run install.sh and check the results.

## Tips for development

### Ubuntu

- Watch dconf settings changes while editing stuff via UI: `dconf watch /`

### macOS

- Find setting changes via `defaults read > /tmp/before`, make changes via UI, `defaults read > /tmp/after`
  and then `code --diff /tmp/before /tmp/after`

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
