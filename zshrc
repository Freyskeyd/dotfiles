# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="avit"
export TERM=xterm-256color
DISABLE_AUTO_TITLE="true"
plugins=(git virtualenvwrapper docker git-flow taskwarrior)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/bootstrap.sh