#!/usr/bin/env bash

################################################################################
# constants
################################################################################

readonly dotfiles_dir="$HOME/Dotfiles"
readonly dotfiles_repo='https://github.com/c-w/Dotfiles.git'


################################################################################
# helper functions
################################################################################

error() {
    local message="$1"
    echo "${message}" >&2
    exit 1
}

check_program_exists() {
     local program="$1"
     hash "${program}" 2>/dev/null
}

package_manager() {
    local manager=''
    $(check_program_exists 'apt-get') && manager='apt-get'
    $(check_program_exists 'yum') && manager='yum'
    [ -n "${manager}" ] \
        && echo "${manager}" \
        || error "no package manager found"
}

system_update() {
    sudo "$(package_manager)" update
    sudo "$(package_manager)" upgrade
}

system_install() {
    local package="$1"
    sudo "$(package_manager)" -y install "${package}"
}


################################################################################
# main
################################################################################

main() {
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
    system_install python3
    system_install python3-dev
    system_install python3-pip
    system_install python3-venv

    # docker
    curl -fsSL https://get.docker.com | sudo bash -
    sudo usermod -aG docker "$USER"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    # node
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    source "$HOME/.nvm/nvm.sh"
    nvm install --lts

    # setup dot-files
    [ ! -d "${dotfiles_dir}" ] && git clone --recursive "${dotfiles_repo}" "${dotfiles_dir}"
    find "${dotfiles_dir}" \( \
            -name ".*" -and \
            -not -wholename "*.git/*" -and \
            -not -name "*.git" -and \
            -not -name "*.gitignore" -and \
            -not -name "*.gitmodules" \) \
        -exec ln -f -s {} ~/ \;
}

main
