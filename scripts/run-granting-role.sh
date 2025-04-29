#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running granting role script for: "
echo $GO_TRIGGER_USER
echo ${GO_TRIGGER_USER}
echo "${!@}"

echo "Im here: "
pwd
ls

cd ..
ls

cd ..
ls

cat godata/config/cruise-config.xml

sed '/<role name="release-manager">/,/<\/role>/ {
    /<users>/a\            <user>'"${!@}"'</user>
}' cruise-config.xml > output.xml

mv output.xml cruise-config.xml
rm -f output.xml
