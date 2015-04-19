#!/bin/sh

cd "$HOME/.dotfiles"
[ "$1" = "ask" ] && export ASK="true"
rake install
