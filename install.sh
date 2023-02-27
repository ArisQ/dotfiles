#!/bin/bash


cd $(dirname $0)

for d in $(find . -type f -name 'install.sh' -mindepth 2); do
    echo "=============================="
    echo "run $d"
    bash $d
done
