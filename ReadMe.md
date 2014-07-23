# Things to do on a new system

1. Create a new ssh key for the machine: `ssh-keygen`
2. Add the contents of *~/.ssh/id_rsa.pub* to *bitbucket.org* and *github.com*
3. Acquire and run the installer script from this repository:
    `sh install_packages.sh`
4. Get some dotfiles set up:
    `git clone --recursive git@bitbucket.org:c-w/dotfiles.git`
5. Move the contents of the repository to your home directory:
    `mv dotfiles/.* ~`
6. Enjoy your fully set up basic development environment :-)
