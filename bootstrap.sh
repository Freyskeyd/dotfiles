#!/usr/bin/env bash

####### SETUP
app_name='dotfiles'
app_dir="$HOME/.$app_name"
git_uri='https://github.com/Freyskeyd/dotfiles.git'
ohmy_dir="$HOME/.oh-my-zsh"
ohmyzsh='https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
git_branch='master'
debug_mode='1'
[ -z "$VUNDLE_URI" ] && VUNDLE_URI="https://github.com/gmarik/vundle.git"

####### SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [[ "$ret" -eq '0' ]]; then
        msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

program_exists() {
    local ret='0'
    type $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ ! "$ret" -eq '0' ]; then
    error "$2"
    else
    success "$1 is available"
    fi
}

variable_set() {
    if [ -z "$1" ]; then
        error "You must have your HOME environmental variable set to continue."
    fi
}

####### SETUP TOOLS
lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

do_backup() {
    if [ -e "$2" ] || [ -e "$3" ] || [ -e "$4" ]; then
        today=`date +%Y%m%d_%s`
        for i in "$2" "$3" "$4"; do
            [ -e "$i" ] && [ ! -L "$i" ] && mv "$i" "$i.$today";
        done
        ret="$?"
        success "$1"
        debug
   fi
}

upgrade_repo() {
      if [ "$1" = "$app_name" ]; then
          cd "$app_dir" &&
          git pull -q origin "$git_branch"
      fi

      if [ "$1" = "vundle" ]; then
          cd "$HOME/.vim/bundle/vundle" &&
          git pull -q origin master
      fi

      ret="$?"
      success "$2"
      debug
}

install_oh_my_zsh() {
    if [ ! -e "$ohmy_dir" ]; then
        curl -L $1 | sh
        ret="$?"
        success "$2"
        debug
    fi
}

clone_repo() {

    if [ ! -e "$app_dir" ]; then
        git clone -q --recursive -b "$git_branch" "$git_uri" "$app_dir"
        ret="$?"
        success "$1"
        debug
    else
        upgrade_repo "$app_name"    "Successfully updated $app_name"
    fi
}

clone_vundle() {
    if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
        git clone -q $VUNDLE_URI "$HOME/.vim/bundle/vundle"
    else
        upgrade_repo "vundle"   "Successfully updated vundle"
    fi
    ret="$?"
    success "$1"
    debug
}

create_symlinks() {
    endpath="$app_dir"

    if [ ! -d "$endpath/.vim/bundle" ]; then
        mkdir -p "$endpath/.vim/bundle"
    fi

    lnif "$endpath/vimrc" "$HOME/.vimrc"
    lnif "$endpath/vimrc.bundles" "$HOME/.vimrc.bundles"
    lnif "$endpath/vim" "$HOME/.vim"

    touch "$HOME/.vimrc.local"

    ret="$?"
    success "$1"
    debug
}

setup_vundle() {
    system_shell="$SHELL"
    export SHELL='/bin/sh'

    vim \
        -u "$app_dir/vimrc.bundles" \
        "+set nomore" \
        "+BundleInstall!" \
        "+BundleClean" \
        "+qall"

    export SHELL="$system_shell"

    success "$1"
    debug
}

###### Main Starter

variable_set "$HOME"
msg "Checking packages"
program_exists "vim" "To install $app_name you need to install Vim."
program_exists "git" "To install $app_name you need to install GIT."
program_exists "curl" "To install $app_name you need to install curl."

install_oh_my_zsh $ohmyzsh "Successfully install Oh My Zsh."

do_backup "Your old configuration will now have a suffix `date +%Y%m%d%S`" \
    "$HOME/.vim" \
    "$HOME/.vimrc"

clone_repo "Successfully cloned $app_name"
create_symlinks "Setting up vim symlinks"
clone_vundle "Successfully cloned vundle"
setup_vundle "Now updating/installing plugins using vundle"

msg "\nThanks for installing $app_name."
