#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script for: "
echo $GO_TRIGGER_USER
echo ${GO_TRIGGER_USER}

echo "Doing sed: "
sed '/<role name="release-manager">/,/<\/role>/ {
    /<users>/a\            <user>'$GO_TRIGGER_USER'</user>
}' /shared_data/cruise-config.xml > /shared_data/output.xml

mv /shared_data/output.xml /shared_data/cruise-config.xml
rm -f /shared_data/output.xml