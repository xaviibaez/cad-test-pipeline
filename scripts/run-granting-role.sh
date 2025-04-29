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

echo "Im here 3: "
cd ..
pwd
ls

echo "Im here 4: "
cd ..
pwd
ls

echo "Im here 5: "
cd config
ls

echo "Finding cruise-config.xml: "
find / -name "cruise-config.xml" 2>/dev/null

cat config/cruise-config.xml

sed '/<role name="release-manager">/,/<\/role>/ {
    /<users>/a\            <user>'"${!@}"'</user>
}' cruise-config.xml > output.xml

mv output.xml cruise-config.xml
rm -f output.xml
