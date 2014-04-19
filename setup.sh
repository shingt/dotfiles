#!/bin/bash

for file in `find $HOME/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

cd $HOME/dotfiles
git submodule init
git submodule update

mkdir $HOME/backup

# git-completion
cd ~/dotfiles
mkdir util
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source util/git-completion.bash


