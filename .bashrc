[ -z "$PS1" ] && return

# history management
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=20000

# standard stuff
shopt -s checkwinsize
shopt -s globstar
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
[ -f /etc/bash_completion ] && ! shopt -oq posix && . /etc/bash_completion

# use colors by default if possible
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# show directory contents after naviation
cd() { builtin cd "$*" && ls; }

# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."

# default editor.
export VISUAL=vim
export EDITOR=vim

# don't use graphical password prompts
unset SSH_ASKPASS
