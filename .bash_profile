# .bash_profile


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.profile
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"


# To uninstall Pow, `curl get.pow.cx/uninstall.sh | sh`
export PATH="/usr/local/opt/sqlite/bin:$PATH"
source ~/.git-completion.bash
