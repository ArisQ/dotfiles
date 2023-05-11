#!/bin/bash

set -e

cd $(dirname $0)

# link source target
link() {
    echo "mkdir -p $(dirname $2)"
    mkdir -p $(dirname $2)

    echo "ln -sf $1 $2"
    ln -sfn $1 $2
}

link $PWD $HOME/.config/awesome

