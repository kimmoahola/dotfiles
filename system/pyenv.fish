set -x PYENV_ROOT $HOME/.pyenv
prepend-path "$PYENV_ROOT/bin"

if status is-interactive
  pyenv init --path | source
  pyenv init - | source
end

if is-macos
  # For pyenv to be able to build python versions
  set -x -g LDFLAGS "-L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl/lib" $LDFLAGS
  set -x -g CPPFLAGS "-I/usr/local/opt/zlib/include -I/usr/local/opt/openssl/include" $CPPFLAGS
end
