#!/bin/sh
if [ $(id -u) = 0 ]; then
   echo "No root pls, you can break something"
   exit 1
fi

if [ $(lsb_release -sc) != "bookworm" ]; then
   echo "This playbook was tested only on debian bookworm. Something can broke."
fi

poetry install
poetry run ansible-galaxy install -r requirements.yml
poetry run ansible-playbook --extra-vars username="$USER" --connection=local --ask-become-pass --inventory 127.0.0.1, --limit 127.0.0.1 main.yml "$@"
