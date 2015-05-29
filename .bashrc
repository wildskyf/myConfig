# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export PS1="\[\e[0;32m\][\[\e[0;31m\]\u\[\e[m\]@\[\e[m\e[0;34m\]\h\[\e[m \e[0;32m\]\W]\$ \[\e[m\]"


# User specific aliases and functions

#Terminal 透明
if [ -n "$WINDOWID" ]; then
	TRANSPARENCY_HEX=$(printf 0x%x $((0xffffffff * 92 / 100)))
	xprop -id "$WINDOWID" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$TRANSPARENCY_HEX"
fi

