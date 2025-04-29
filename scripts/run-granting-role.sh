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

echo "Printing cruise-config.xml: "
cat /shared_data/cruise-config.xml

echo "Doing sed: "
sed '/<role name="release-manager">/,/<\/role>/ {
    /<users>/a\            <user>'"${!@}"'</user>
}' /shared_data/cruise-config.xml > output.xml

echo "Im here 4: "

mv output.xml cruise-config.xml
rm -f output.xml
