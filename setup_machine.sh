#!/bin/sh

# helper functions
system_update() {
    sudo apt-get update
    sudo apt-get upgrade
}

system_install() {
    local package="$1"
    sudo apt-get -y install "${package}"
}

python_install() {
    local package="$1"
    sudo pip install "${package}"
}

system_update

# systems stuff
system_install man
system_install curl
system_install htop
system_install software-properties-common
system_install python-software-properties
system_install aspell-en

# development stuff
system_install build-essential
system_install git
system_install tmux
system_install vim
system_install cloc

# python stuff
system_install python
system_install python3
system_install python-dev
system_install python-pip
python_install ipython
python_install virtualenv
python_install flake8
python_install pylint

# setup dot-files
dotfiles_dir="$HOME/Dotfiles"
[ ! -d "${dotfiles_dir}" ] && git clone --recursive https://github.com/c-w/Dotfiles.git "${dotfiles_dir}"
find "${dotfiles_dir}" \( \
        -name ".*" -and \
        -not -wholename "*.git/*" -and \
        -not -name "*.git" -and \
        -not -name "*.gitignore" -and \
        -not -name "*.gitmodules" \) \
    -exec ln -f -s {} ~/ \;
