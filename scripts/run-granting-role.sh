#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script for: "
echo $GO_TRIGGER_USER
echo ${GO_TRIGGER_USER}

echo "Im here 2: "
pwd
ls

echo "Finding cruise-config.xml: "
find / -name "cruise-config.xml" 2>/dev/null

cat /shared_data/cruise-config.xml

sed '/<role name="release-manager">/,/<\/role>/ {
    /<users>/a\            <user>'"${!@}"'</user>
}' cruise-config.xml > output.xml

mv output.xml cruise-config.xml
rm -f output.xml
