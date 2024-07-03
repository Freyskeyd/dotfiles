# Dotfiles

Screenshots

## Contents ##
1. [Details](#details)
2. [Features](#features)
3. [Dependencies](#dependencies)
4. [Installation](#installation)
5. [Folder Structure](#folder-structure)
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

```bash
# Move to clone dotfiles directory
$ cd DOTFILES_PATH

# Install brew deps
$ brew bundle --file=brew/Brewfile

# Sync directories to ~/.config
$ stow --target ~/.config .
```

If you want to have access to the same capabilities regarding yabai, you need to follow the [steps](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)

## Folder Structure


- `brew`: Contains a `Brewfile` to install dependencies
- `gh`: Configuration for the [GH](https://cli.github.com/) cli
- `gh-dash`: Configuration for [GH-dash](https://github.com/dlvhdr/gh-dash) dashboard
- `git`: Configuration for `git`
- `nvim`: Configuration for `neovim`
- `rustfmt`: Configuration of the `rustfmt` tool
- `skhd`: Configuration and keybindings for [skhd](https://github.com/koekeishiya/skhd) daemon
- `starship.toml`: Configuration for the [starship](https://starship.rs/) prompt
- `tmux`: Configuration for tmux
- `wezterm`: Configuration for the [wezterm](https://wezfurlong.org/wezterm/) terminal emulator
- `yabai`: Configuration for [yabai](https://github.com/koekeishiya/yabai) (extra installation steps are needed for yabai, see below)
- `zsh`: Zsh configurations


