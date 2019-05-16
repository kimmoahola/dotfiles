if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/cask
brew tap buo/cask-upgrade

# Install packages

apps=(
  docker
  firefox
  font-input
  google-chrome
  google-chrome-canary
  insomnia
  iterm2
  pycharm
  skitch
  sourcetree
  spectacle
  spotify
  tunnelblick
  vagrant
  virtualbox
  visual-studio-code
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
quick_look_apps=(
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlimagesize
  webpquicklook
  suspicious-package
  qlvideo
)

brew cask install "${quick_look_apps[@]}"
