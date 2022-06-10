#!/usr/bin/env bash

set -eou pipefail

if [ -n "${1+set}" ]; then
    verbosity="$1"
else
    verbosity=""
fi

ansible-playbook -e target_user=$USER -i hosts.yml --ask-become-pass site.yml ${verbosity}
