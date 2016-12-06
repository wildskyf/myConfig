# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/wildsky/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='agnoster' # "sunrise"
DEFAULT_USER='wildsky'

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(autojump history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export LC_ALL="en_US.UTF-8"
# export LANG=en_US.UTF-8

export EDITOR=emacs
export NVM_DIR=~/.nvm

# aliases
alias vi='emacs -nw'
alias vim='emacs -nw'
alias emacs='emacs -nw'
alias runmattermost='docker run --name mattermost-preview -d --publish 8065:8065 mattermost/platform'
alias runnvm='source $(brew --prefix nvm)/nvm.sh'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/mysql/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GOROOT="/usr/local/go/"
ulimit -n 8096

# alias 'uninstall pow'='curl get.pow.cx/uninstall.sh | sh'%
