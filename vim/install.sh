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

ln -sfn ${PWD}/mysnippets ~/.vim/plugged/ultisnips/mysnippets
ln -sf ${PWD}/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py


# undo history directory
mkdir -p ~/.undo_history/

## YouCompleteMe
# sudo
# emerge --ask clang go nodejs ctags
# go env -w GO111MODULE=on
# go env -w GOPROXY=https://goproxy.cn,direct
# cd ~/.vim/plugged/YouCompleteMe && \
#     python3 install.py --clangd-completer --go-completer --ts-completer

