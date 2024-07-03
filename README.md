# Dotfiles

Screenshots

## Contents ##
1. [Details](#details)
2. [Features](#features)
3. [Dependencies](#dependencies)
4. [Installation](#installation)
5. [Folder Structure](#folderStructure)
6. [Application Theming](#appTheming)
7. [Keybinds](#keybinds)
8. [Notes](#notes)

<a name="details"></a>
## Details ##
+ **Shell**: ZSH
+ **Theme**: OneNord
+ **Terminal**: Wezterm

<a name="features"></a>
## Features ##
+ lightweight
+ Easy installation / configuration
+ Very few dependencies
+ Neovim configuration
+ Tiling window manager
+ Hotkey daemon

<a name="dependencies"></a>
## Dependencies ##

|Dependency|Description|Install|
|:----------:|:-------------:|:---:|
|`homebrew`|Package Manager for macOS| [Install](https://brew.sh/)


## Installation

After installing `homebrew`, clone this repository (the path to the repo will be define as `DOTFILES_PATH` for the rest of the `README`).

The repository contains various folder, you can use all of them or pick only the one you want.
However, the `brew` install will install all packages needed. If you want to remote some dependencies, you need to edit the file in `DOTFILES_PATH/brew`.

```
# Move to clone dotfiles directory
$ cd DOTFILES_PATH

# Install brew deps
$ brew bundle --file=brew/Brewfile

# Sync directories to ~/.config
$ stow --target ~/.config .
```
