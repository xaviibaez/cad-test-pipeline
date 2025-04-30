#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script for: "
echo $GO_TRIGGER_USER
echo ${GO_TRIGGER_USER}

if grep -q "<role name=\"release-manager\">.*<user>${GO_TRIGGER_USER}</user>" /shared_data/cruise-config.xml; then
    echo "User ${GO_TRIGGER_USER} already exists in the release-manager role. Skipping addition."
else
    echo "Adding user ${GO_TRIGGER_USER} to the release-manager role."
    sed -i '/<role name="release-manager">/,/<\/role>/ {
        /<users>/a\            <user>'$GO_TRIGGER_USER'</user>
    }' /shared_data/cruise-config.xml
fi