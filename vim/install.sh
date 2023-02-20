#!/bin/bash

set -e

cd $(dirname $0)

TARGET=$HOME/.vimrc

[ -f $TARGET ] && [ ! -L $TARGET ] && echo "$TARGET exists and is not a symlink" && exit

echo "ln -sf $PWD/vimrc $TARGET"
ln -sf $PWD/vimrc $TARGET


# Download plug.vim and put it in ~/.vim/autoload
mkdir -p ~/.vim/autoload
[ -f ~/.vim/autoload/plug.vim ] || \
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://github.com/junegunn/vim-plug/issues/675
vim +'PlugInstall --sync' +qa

