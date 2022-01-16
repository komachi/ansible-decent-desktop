#!/bin/sh
if [ $(id -u) = 0 ]; then
   echo "No root pls, you can break something"
   exit 1
fi

if [ $(lsb_release -sc) != "bullseye" ]; then
   echo "This playbook was tested only on debian bullseye. Something can broke."
fi

#sudo apt install ansible python3-jmespath python3-passlib python3-lxml python3-libvirt
#ansible-galaxy install -r requirements.yml
ansible-playbook --extra-vars username="$USER" --connection=local --ask-become-pass --inventory 127.0.0.1, --limit 127.0.0.1 main.yml
