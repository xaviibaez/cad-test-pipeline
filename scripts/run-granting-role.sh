#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script"
echo "$@"
echo "-"
echo $@
echo "-"
echo $GO_TRIGGER_USER
echo "-"
echo ${GO_TRIGGER_USER}
echo "-"
echo '$GO_TRIGGER_USER'
echo "-"
echo '{$GO_TRIGGER_USER}'