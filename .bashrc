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

# use colors by default if possible
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# show directory contents after naviation
cd() {
    builtin cd "$*";
    nfiles=$(ls . | wc -l)
    if [ $nfiles -lt 100 ]; then
        ls
    else
        echo "(${nfiles} files)"
    fi
}

# pop up to the git-root to run make
make() {
    local gitdir="$(git rev-parse --show-toplevel 2> /dev/null)"
    if [ $? -eq 0 ]; then
        builtin cd "${gitdir}" > /dev/null
        /usr/bin/make $@
        builtin cd - > /dev/null
    else
        /usr/bin/make $@
    fi
}

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

# source extra files
[ -f ~/.git-completion.sh ] && . ~/.git-completion.sh
[ -f ~/.tmux-git.sh ] && . ~/.tmux-git.sh

# default editor.
export VISUAL=vim
export EDITOR=vim
export TERM=xterm

# don't use graphical password prompts
unset SSH_ASKPASS
