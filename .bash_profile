source .bash.d/alias.bash
source .bash.d/git-completion.bash

export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.cargo/bin:/usr/local/opt/go/libexec/bin
export BASH_IT="/Users/wildsky/.bash_it"
export BASH_IT_THEME='bobby' # location /.bash_it/themes/
export GIT_HOSTING='git@github.com' # for private repo
export SCM_CHECK=true # version control status checking

unset MAILCHECK # Don't check mail

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Load Bash It
source "$BASH_IT"/bash_it.sh
eval "$(rbenv init -)"
