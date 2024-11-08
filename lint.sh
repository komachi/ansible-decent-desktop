#!/bin/sh
poetry run ansible-lint --exclude roles/gantsign.keyboard --exclude roles/networking/files/stubby.yml --fix -p main.yml roles