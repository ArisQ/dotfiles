#!/bin/bash


# ```nvim
# :call mkdir(stdpath('config'), 'p')
# :exe 'edit '.stdpath('config').'/init.vim'
# ```
#

set -e

cd $(dirname $0)

# link source target
link() {
    echo "mkdir -p $(dirname $2)"
    mkdir -p $(dirname $2)

    echo "ln -sf $1 $2"
    ln -sfn $1 $2
}

# TODO: use XDG cofig variable
link $PWD/config $HOME/.config/nvim

# install packer
PACKER_PATH=$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
[ -d $PACKER_PATH ] || \
git clone --depth 1 git@github.com:wbthomason/packer.nvim.git $PACKER_PATH

