#!/usr/bin/env bash

if [ ! -d ~/.bash/git-aware-prompt ]; then
    mkdir ~/.bash
    pushd ~/.bash
    git clone git://github.com/jimeh/git-aware-prompt.git
    popd >/dev/null
fi

for d in .*; do
    if [ -f $d ] && [ "$d" != ".mbsyncrc" ]; then
        src=$PWD/$d
        dest=~/$d
        if [ ! -f "$dest" ]; then
            echo "Linking $dest to $src"
            ln -s "$src" "$dest"
        else
            echo "$dest already exists, skipping"
        fi
    fi
done
echo 'Done.'
