#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

complete -cf sudo
complete -cf man

export VISUAL="vim"

alias ls='ls --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'

alias wttr='curl http://wttr.in/Lviv '

#PS1='[\u@\h \W]\$ '  # To leave the default one
PS1="\[\e[32;1m\][\[\e[37;1m\]\u@\h\[\e[32;1m\]: \[\e[38;1m\]\w\[\e[32;1m\]]\[\e[0m\]\$ "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(/home/mama/.rakudobrew/bin/rakudobrew init -)"
