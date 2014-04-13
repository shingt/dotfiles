#!/bin/bash

for file in `find $HOME/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

cd $HOME/dotfiles
git submodule init
git submodule update

mkdir $HOME/backup
