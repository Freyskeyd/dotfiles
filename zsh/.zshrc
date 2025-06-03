if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

zinit light joshskidmore/zsh-fzf-history-search

source ~/.secret.zsh
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/zed.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

gpgconf --launch gpg-agent
source <(av completion zsh)
