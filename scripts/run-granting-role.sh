#!/usr/bin/env bash
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script for: "
echo $GO_TRIGGER_USER
echo ${GO_TRIGGER_USER}

fgrep -A5 '<role name="release-manager">' /shared_data/cruise-config.xml | fgrep -q '<user>'$GO_TRIGGER_USER'</user>'
if [ $? = 0 ]; then
    echo "User ${GO_TRIGGER_USER} already exists in the release-manager role."
    exit 1
fi

sed '/<role name="release-manager">/,/<\/role>/ {
    /<users>/a\
            <user>'$GO_TRIGGER_USER'</user>
}' /shared_data/cruise-config.xml > /shared_data/output.xml

mv /shared_data/output.xml /shared_data/cruise-config.xml
rm -f /shared_data/output.xml