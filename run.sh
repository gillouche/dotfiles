#!/usr/bin/env bash

set -eou pipefail

if [ -n "${1+set}" ]; then
    verbosity="$1"
else
    verbosity=""
fi

TARGET_USER=$USER
sudo su -c "ansible-playbook -i hosts.yml "playbook.yml" --extra-vars 'target_user=$TARGET_USER' ${verbosity}"
