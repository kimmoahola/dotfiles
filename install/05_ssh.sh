#!/usr/bin/env bash

if ! [ -f "$HOME/.ssh/id_ecdsa" ]; then
  ssh-keygen -t ecdsa-sha2-nistp521 -b 521 -C "mykey" -f $HOME/.ssh/id_ecdsa -N ""
fi
