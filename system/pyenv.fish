set -x PYENV_ROOT $HOME/.pyenv
prepend-path "$PYENV_ROOT/bin"

if status is-interactive
  . (pyenv init -|psub)
  . (pyenv virtualenv-init -|psub)
end
