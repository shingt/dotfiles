#!/bin/bash

for file in `find $HOME/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

cd $HOME/dotfiles
git submodule init
git submodule update
mkdir util

mkdir $HOME/backup

#
# git-completion
#
cd ~/dotfiles/.zsh.d
wget https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
wget https://github.com/git/git/raw/master/contrib/completion/git-completion.zsh
mv git-completion.zsh _git

