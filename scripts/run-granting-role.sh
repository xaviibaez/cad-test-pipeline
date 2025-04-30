#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script for: "
echo $GO_TRIGGER_USER
echo ${GO_TRIGGER_USER}

xmllint --xpath '//role[@name="release-manager"]/users/user[text()="'$GO_TRIGGER_USER'"]' shared_data/cruise-config.xml >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "User ${GO_TRIGGER_USER} already exists in the release-manager role."
    exit 0
fi

echo "Adding user ${GO_TRIGGER_USER} to the release-manager role."
sed -i '/<role name="release-manager">/,/<\/role>/ {
    /<users>/a\            <user>'$GO_TRIGGER_USER'</user>
}' /shared_data/cruise-config.xml