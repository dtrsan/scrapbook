#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "usage: $0 [ansible-user] [ansible.pub]"
  exit 1
fi

ANSIBLE_USER=$1
ANSIBLE_PUB_KEY=$2
SUDOERS_RULE="$ANSIBLE_USER	ALL=(ALL:ALL) NOPASSWD:ALL"

if [ /usr/bin/id -u $ANSIBLE_USER &> /dev/null ]; then
  echo "$ANSIBLE_USER already exists."
  exit 0
fi

apt-get update && apt-get install -y --no-install-recommends python2.7

/usr/sbin/adduser --disabled-password --gecos "Ansible User" $ANSIBLE_USER

if [ -f $ANSIBLE_PUB_KEY ]; then
  /usr/bin/install -b -o $ANSIBLE_USER -g $ANSIBLE_USER -d -m 755 /home/$ANSIBLE_USER/.ssh
  /usr/bin/install -b -o $ANSIBLE_USER -g $ANSIBLE_USER -m 644 $ANSIBLE_PUB_KEY /home/$ANSIBLE_USER/.ssh/authorized_keys2
else
  echo "Cannot configure ssh access. $ANSIBLE_PUB_KEY doesn't exist or it's not a file."
fi

umask 227
echo $SUDOERS_RULE > /etc/sudoers.d/ansible

