#!/usr/bin/env bash

for file in $HOME/.dotfiles/.{aliases,functions,exports}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

if ! [ -L $HOME/.gitconfig ]; then
  ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
fi

source $HOME/.dotfiles/.git-flow-completion.zsh
