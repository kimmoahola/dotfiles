#!/usr/bin/env bash

if ! [ -f "$HOME/.ssh/id_rsa.pub" ]; then
  ssh-keygen -t rsa -b 4096 -C "mykey" -f $HOME/.ssh/id_rsa -N ""
fi

