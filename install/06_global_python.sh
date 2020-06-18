#!/usr/bin/env bash

GLOBAL_PYTHON_VERSION="3.7.7"

fish -c "pyenv install -s $GLOBAL_PYTHON_VERSION; pyenv global $GLOBAL_PYTHON_VERSION"
