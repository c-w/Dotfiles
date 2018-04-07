[ -z "$PS1" ] && return

# history management
export HISTCONTROL=ignoreboth:erasedups
(shopt | grep -q histappend) && shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=20000

# standard stuff
shopt -s checkwinsize
(shopt | grep -q globstar) && shopt -s globstar
if [ -x /usr/bin/lesspipe ]; then eval "$(SHELL=/bin/sh lesspipe)"; fi
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then . /etc/bash_completion; fi

# set up the terminal prompt
export PS1='\u@\H:\w$ '

# use colors by default if possible
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# utility functions

cd() {
    builtin cd "$*";
    nfiles=$(ls . | wc -l)
    if [ $nfiles -lt 100 ]; then
        ls
    else
        echo "(${nfiles} files)"
    fi
}

random_string() {
    < /dev/urandom tr -dc '_A-Z-a-z-0-9' | head -c${1:-32}
}

# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# source extra files
[ -f ~/.git-completion.sh ] && . ~/.git-completion.sh
[ -f ~/.tmux-git.sh ] && . ~/.tmux-git.sh

# default editor.
export VISUAL=vim
export EDITOR=vim
export TERM=xterm

# don't use graphical password prompts
unset SSH_ASKPASS
