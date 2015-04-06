#!/usr/bin/env sh

app_dir="$HOME/.dotfiles"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

rm -f $HOME/.vimrc
rm -f $HOME/.vimrc.bundles
rm -fr $HOME/.vim
rm -f $HOME/.zshrc

rm -rf $app_dir
