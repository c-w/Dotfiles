#!/bin/sh

# helper functions
apt_get_update() {
    sudo apt-get update
    sudo apt-get upgrade
}

apt_get_install() {
    local package="$1"
    sudo apt-get -y install "${package}"
}

pip_install() {
    local package="$1"
    sudo pip install "${package}"
}

add_apt_repository() {
    local ppa="$1"
    grep -q "^deb.*${ppa}" /etc/apt/sources.list.d/*
    if [ $? -ne 0 ]; then
        sudo add-apt-repository -y "ppa:${ppa}"
        sudo apt-get update
    fi
}

apt_get_update

# systems stuff
apt_get_install man
apt_get_install curl
apt_get_install htop
apt_get_install software-properties-common
apt_get_install python-software-properties

# development stuff
apt_get_install build-essential
apt_get_install git
apt_get_install tmux
apt_get_install vim
apt_get_install cloc

# python stuff
apt_get_install python
apt_get_install python3
apt_get_install python-dev
apt_get_install python-pip
pip_install ipython
pip_install virtualenv
pip_install flake8
pip_install pylint

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
