## Install

:warning: Don't just run these files without first reviewing the code and removing stuff you don't need/want. Running the installation script may break your system. Use at your own risk!

The installation is designed to be idempotent, meaning it can be run again.

1. Install all OS updates
1. On Mac: `xcode-select --install`
1. Install brew
1. `brew install bash fish stow git` or `sudo apt-get --assume-yes install bash fish stow git`
1. On Mac: `sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"`
1. Make fish shell a default
1. Install [fisher](https://github.com/jorgebucaran/fisher)
1. `git clone git@github.com:kimmoahola/dotfiles.git ~/.dotfiles`
1. `cd ~/.dotfiles`
1. `stow -v 2 .`
1. `./install.sh`
1. Open up a new terminal (should open as a fish shell)
1. `./post_install.fish`

### After install tasks

- Add ssh key to github
  `cat $HOME/.ssh/id_ecdsa.pub`
  https://github.com/settings/keys
- Setup Raycast app
  - Disable Spotlight keyboard shortcuts
  - Configure Raycast shortcut to cmd-space
- Login to visual studio using github
- Start Maccy (and start it at boot)
- Add 'Hack Nerd Font Mono', 'Comic sans MS' to editors and terminal

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>

    Commands:
    clean            Clean up caches (brew, npm)
    help             This help message
    update           Update packages and pkg managers (brew, brew cask, npm)

## Upgrading to newer Ubuntu

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
