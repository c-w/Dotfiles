# Things to do on a new system

- Create a new ssh key for the machine: `ssh-keygen -t rsa`
- Add the contents of *~/.ssh/id_rsa.pub* to *github.com*
- Acquire the installer script from this repository:
    `wget --no-check-certificate https://raw.githubusercontent.com/c-w/Dotfiles/master/setup_machine.sh`
- Run the install script:
    `sh setup_machine.sh`
- Enjoy your fully set up basic development environment :-)
