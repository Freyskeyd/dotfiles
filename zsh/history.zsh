function zsh_history {
    local clear list
    zparseopts -E c=clear l=list

    if [[ -n "$clear" ]]; then
        echo -n > "$HISTFILE"
	echo >&2 History file deleted. Reload the session to see its effects.
    elif [[ -n "$list" ]]; then
        builtin fc "$@"
    else
        [[ ${@[-1]} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
    fi
}

# HISTORY file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# HISTORY command configuration
setopt extended_history # record timestamp of command
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exeeds HISTSIZE
setopt hist_ignore_dups # ignore duplicated commands hist list
setopt hist_ignore_space # ignore commands that start with space
setopt hist_verify # show command with history expansion to user before running it
setopt inc_append_history # add commands to HISTFILE in order of execution
setopt share_history # share command history data

HIST_STAMPS="dd/mm/yyyy"

# Rebind keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
