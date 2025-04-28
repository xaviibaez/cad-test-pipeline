#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script"
echo "$@"
echo "1-"
echo $@
echo "2-"
echo $GO_TRIGGER_USER
echo "3-"
echo ${GO_TRIGGER_USER}
echo "4-"
echo '$GO_TRIGGER_USER'
echo "5-"
echo '{$GO_TRIGGER_USER}'
echo "6-"
echo `{$GO_TRIGGER_USER}`
echo "7-"
echo `$@`
echo "8-"
echo "${!@}"