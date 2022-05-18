#!/usr/bin/env bash

set -e
playbook=$1
verbosity=$2

if [ -z "${playbook}" ]; then
    echo "playbook name must be provided. Possible values: home, pentest"
    echo "Example: ./run.sh home"
    exit -1
fi

TARGET_USER=$USER
sudo su -c "ansible-playbook -i hosts.yml "playbook_${playbook}.yml" --extra-vars 'target_user=$TARGET_USER' ${verbosity}"
