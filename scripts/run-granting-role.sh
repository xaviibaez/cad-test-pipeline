#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script"
echo $GO_TRIGGER_USER
echo ${GO_TRIGGER_USER}
echo "${!@}"

cd ~/godata/config
cat cruise-config.xml
