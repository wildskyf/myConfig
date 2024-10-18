include () { [[ -f "$1" ]] && source "$1" }

###############################################

XDG_CACHE_HOME="$HOME/.config/shell/cache"

SHELL_CONFIG_FOLDER="$HOME/.config/shell"

include "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
include "$SHELL_CONFIG_FOLDER/zinit.zsh"
include "$SHELL_CONFIG_FOLDER/p10k.zsh"
include "$SHELL_CONFIG_FOLDER/alias.zsh"
include "$SHELL_CONFIG_FOLDER/export.zsh"
include "$SHELL_CONFIG_FOLDER/app-related-init.zsh"

# include "$HOME/.config/k8s.yml"
# include "$HOME/.config/git-completion.zsh"

for f in $SHELL_CONFIG_FOLDER/private-configs/*; do include $f; done

###############################################

unset MAILCHECK # Don't check mail

autoload -Uz compinit && compinit

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# INPUTRC='$HOME/.config/shell/inputrc'
