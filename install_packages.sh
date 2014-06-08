#!/bin/sh

# systems stuff
sudo apt-get install man
sudo apt-get install curl
sudo apt-get install software-properties-common python-software-properties

# development stuff
sudo apt-get install build-essential
sudo apt-get install git
sudo apt-get install tmux
sudo apt-get install vim
sudo apt-get install cloc

# java stuff
sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update
sudo apt-get install oracle-java7-installer oracle-java7-set-default
sudo apt-get install ant

# python stuff
sudo apt-get install python
sudo apt-get install python3
sudo apt-get install python-pip
sudo pip install ipython
sudo pip install virtualenv
