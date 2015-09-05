# Things to do on a new system

- Create a new ssh key for the machine: `ssh-keygen`
- Add the contents of *~/.ssh/id_rsa.pub* to *bitbucket.org* and *github.com*
- Acquire and run the installer script from this repository:
    `sh install_packages.sh`
- Get some dotfiles set up:
    `git clone --recursive git@bitbucket.org:c-w/dotfiles.git`
- Move the contents of the repository to your home directory:
    `mv dotfiles/.* ~`
- Enjoy your fully set up basic development environment :-)
