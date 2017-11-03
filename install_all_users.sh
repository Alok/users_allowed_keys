#!/bin/bash
for dir in */ ; do
USER=${dir::-1}
./install_users.sh $USER
usermod -aG docker $USER
done

# Always sudo users
usermod -aG sudo sauhaarda
usermod -aG sudo sascha
usermod -aG sudo karlzipser

host=`hostname`
if [ $host == 'bdd3' ]; then # bdd3 sudo users
    usermod -aG sudo bala
fi
if [ $host == 'bdd4' ]; then # bdd4 sudo users
    usermod -aG sudo aga
fi
if [ $host == 'bdd5' ]; then # bdd4 sudo users
    usermod -aG sudo ehou
fi
if [ $host == 'bdd6' ]; then # bdd4 sudo users
    usermod -aG sudo danqing0703
    usermod -aG sudo yexia
fi

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:jonathonf/python-3.6        
sudo apt-get -y update
sudo apt-get -y install neovim tmux zsh highlight python3.6  python3.6-dev python3.6-venv
