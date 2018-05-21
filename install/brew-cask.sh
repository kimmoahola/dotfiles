if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap buo/cask-upgrade

# Install packages

apps=(
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
  virtualbox
  visual-studio-code
)

for app in "${apps[@]}"; do
	brew cask install "${app}"
done

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

for app in "${quick_look_apps[@]}"; do
	brew cask install "${app}"
done

brew cask cleanup
