#!/bin/bash


# ```nvim
# :call mkdir(stdpath('config'), 'p')
# :exe 'edit '.stdpath('config').'/init.vim'
# ```
#

set -e

cd $(dirname $0)

# TODO: link nvim directory
# TODO: use XDG config variable
TARGET=$HOME/.config/nvim/init.vim

echo "mkdir -p $(dirname $TARGET)"
mkdir -p $(dirname $TARGET)

echo "ln -sf $PWD/init.vim $TARGET"
ln -sf $PWD/init.vim $TARGET

