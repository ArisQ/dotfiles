#!/bin/bash

if [[ $- == *i* ]]; then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# load application setting from ~/.env.d/*.sh
if [ -d "$HOME/.env.d" ]; then
  for i in $HOME/.env.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
