# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
alias ll='ls -al'


if [[ $- == *i* ]]; then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'

    bind '"\C-p": history-search-backward'
    bind '"\C-n": history-search-forward'
fi


# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"


# load application setting from ~/.env.d/*.sh
if [ -d "$HOME/.env.d" ]; then
  for i in $HOME/.env.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

