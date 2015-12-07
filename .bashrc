# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# 彩繪 terminal 起始字串
if [ -n "$WINDOWID" ]; then
	export PS1="\[\e[0;32m\][\[\e[0;31m\]\u\[\e[m\]@\[\e[m\e[0;34m\]\h\[\e[m \e[0;32m\]\W]\ >>>\[\e[m\]"
fi

alias update='sudo dnf update -y'
