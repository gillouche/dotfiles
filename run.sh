#!/usr/bin/env bash

set -eou pipefail

if [ -n "${1+set}" ]; then
    verbosity="$1"
else
    verbosity=""
fi

ansible-playbook -i hosts.yml site.yml --ask-become-pass -e target_user=$USER ${verbosity}
