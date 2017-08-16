#!/bin/bash
for dir in */ ; do
USER=${dir::-1}
useradd -m $USER
su $USER <<'EOF'
mkdir -p ~/.ssh
chmod 0700 ~/.ssh
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa -b 4096
EOF
cp $USER/.ssh/authorized_keys /home/$USER/.ssh/authorized_keys
chown $USER:$USER /home/$USER/.ssh/authorized_keys
cd $USER
cp -R * .[^.]* /home/$USER/
chsh -s `which bash` $USER
done

# DEFAULT PASSWORDS AND SUDO USERS
usermod -aG sudo sauhaarda
echo sauhaarda:password | chpasswd
usermod -aG sudo tpankaj
echo tpankaj:password | chpasswd
