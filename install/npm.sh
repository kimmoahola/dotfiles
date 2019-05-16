if ! is-executable brew -o ! is-executable git; then
  echo "Skipped: npm (missing: brew and/or git)"
  return
fi

brew install nvm

mkdir $HOME/.nvm

export DOTFILES_BREW_PREFIX_NVM=`brew --prefix nvm`
set-config "DOTFILES_BREW_PREFIX_NVM" "$DOTFILES_BREW_PREFIX_NVM" "$DOTFILES_CACHE"

if [ -f "$DOTFILES_BREW_PREFIX_NVM/nvm.sh" ]; then
  export NVM_DIR=$HOME/.nvm
  source "$DOTFILES_BREW_PREFIX_NVM/nvm.sh"
fi

ln -sfv "$DOTFILES_BREW_PREFIX_NVM/nvm.sh" "$HOME/.nvm"

nvm install 10
nvm alias default 10
nvm use default

# Globally install with npm

packages=(
  eslint
  eslint-config-airbnb-base
  eslint-config-prettier
  eslint-plugin-import
  get-port-cli
  nodemon
  npm
  prettier
  release-it
  spot
  superstatic
  svgo
  tldr
  underscore-cli
)

npm install -g "${packages[@]}"

npm cache clean --force

mkdir -p $HOME/.config/fish/functions
curl -sSL https://raw.githubusercontent.com/brigand/fast-nvm-fish/master/nvm.fish > $HOME/.config/fish/functions/nvm.fish
