# My dotfiles

These are my dotfiles. Installation script will install various software and setup the shell to be my style. Also some Ubuntu and macOS settings are modified.

It targets Ubuntu and macOS systems. Last tested on Ubuntu 20.04 and macOS 12.1.

## Package overview

- Fish shell with [functions and aliases](system)
- [Various system packages](install/01_packages.sh) installed with brew or apt-get
- [Various npm packages](install/02_npm.sh)
- [Various desktop packages](install/03_desktop_packages.sh)
- [Configs for some programs](configs)

## Install

:warning: Don't just run these files without first reviewing the code and removing stuff you don't need/want. Running the installation script may break your system. Use at your own risk!

The installation is designed to be idempotent, meaning it can be run again.

First **install all OS updates**.

On a sparkling fresh installation of macOS

    xcode-select --install

Install font: Noto Mono Nerd Font Complete Mono from nerd-fonts at https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf

Install the dotfiles with either Git or curl/wget:

### Clone with Git

    git clone git@github.com:kimmoahola/dotfiles.git ~/.dotfiles
    bash ~/.dotfiles/install.sh

### Remotely install using curl

Alternatively, you can install this into `~/.dotfiles` remotely without Git using curl:

    bash -c "`curl -fsSL https://raw.github.com/kimmoahola/dotfiles/master/remote-install.sh`"

Or, using wget:

    bash -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/kimmoahola/dotfiles/master/remote-install.sh`"

### After install tasks

- In .dotfiles dir
  - `git init`
  - `git remote add origin git@github.com:kimmoahola/dotfiles.git`
- Add ssh key to github
  `cat $HOME/.ssh/id_ecdsa.pub`
  https://github.com/settings/keys
- Setup Raycast app
  - Disable Spotlight keyboard shortcuts
  - Configure Raycast shortcut to cmd-space
- Login to visual studio using github
- Start Murus firewall
- Start Maccy (and start it at boot)
- Install https://vimacapp.com/ (and start it at boot)

### Add Fira Code font to editors

Various instructions: https://github.com/tonsky/FiraCode#editor-support

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

## "Manual"

### siege

`siege --concurrent=1 --reps=10 --header="Cookie: sessionid=asdfasdf" https://example.com`
