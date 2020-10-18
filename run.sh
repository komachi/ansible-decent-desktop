#!/bin/sh
if [ $(id -u) = 0 ]; then
   echo "No root pls, you can break something"
   exit 1
fi

if [ $(lsb_release -sc) != "buster" ]; then
   echo "This playbook was tested only on debian buster. Something can broke."
fi

sudo apt install -t buster-backports ansible
sudo apt install python3-jmespath python3-passlib python3-lxml python-libvirt
ansible-playbook --extra-vars username="$USER" --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 main.yml
