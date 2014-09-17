#!/bin/sh

# helper functions
add_apt_repository() {
    local ppa="$1"
    grep -q "^deb.*${ppa}" /etc/apt/sources.list.d/*
    if [ $? -ne 0 ]; then
        sudo add-apt-repository -y "ppa:${ppa}"
        sudo apt-get update
    fi
}

# systems stuff
sudo apt-get -y install man
sudo apt-get -y install curl
sudo apt-get -y install software-properties-common
sudo apt-get -y install python-software-properties

# development stuff
sudo apt-get -y install build-essential
sudo apt-get -y install git
sudo apt-get -y install tmux
sudo apt-get -y install vim
sudo apt-get -y install cloc

# java stuff
add_apt_repository webupd8team/java
sudo apt-get -y install oracle-java7-installer
sudo apt-get -y install oracle-java7-set-default
sudo apt-get -y install ant

# python stuff
sudo apt-get -y install python
sudo apt-get -y install python3
sudo apt-get -y install python-dev
sudo apt-get -y install python-pip
sudo pip install ipython
sudo pip install virtualenv
sudo pip install flake8
sudo pip install pylint

# setup stuff
dotfiles_dir="$HOME/Dotfiles"
[ ! -d "${dotfiles_dir}" ] && git clone --recursive https://github.com/c-w/Dotfiles.git "${dotfiles_dir}"
find "${dotfiles_dir}" \( \
        -name ".*" -and \
        -not -wholename "*.git/*" -and \
        -not -name "*.git" -and \
        -not -name "*.gitignore" -and \
        -not -name "*.gitmodules" \) \
    -exec ln -f -s {} ~/ \;
