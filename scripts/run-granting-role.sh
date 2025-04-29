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

echo "Im here 4: "
cat /shared_data/output.xml

mv /shared_data/output.xml /shared_data/cruise-config.xml

echo "Im here 5: "
cat /shared_data/cruise-config.xml
rm -f output.xml

echo "Im here 6: "
ls