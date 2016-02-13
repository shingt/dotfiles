#!/bin/bash

DOTFILES_DIR=src/github.com/shingt/dotfiles
for src in `find $HOME/$DOTFILES_DIR -name '.*' | grep -v "$DOTFILES_DIR/.git$"`; do
  dst=`echo "$src" | sed s:$HOME/$DOTFILES_DIR/::g`
  ln -sf $src $HOME/$dst
done

cd $HOME/$DOTFILES_DIR
git submodule init
git submodule update
mkdir util

mkdir $HOME/backup

#
# git-completion
#
cd $HOME/$DOTFILES_DIR/.zsh.d
wget https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
wget https://github.com/git/git/raw/master/contrib/completion/git-completion.zsh
mv git-completion.zsh _git

