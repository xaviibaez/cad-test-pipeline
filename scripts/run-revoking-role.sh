#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

echo "Running revoking role script for: "
echo $GO_TRIGGER_USER
echo ${GO_TRIGGER_USER}
echo "${!@}"

cd ..
cat godata/config/cruise-config.xml

sed '/<role name="release-manager">/,/<\/role>/ {
    /<user>'"${!@}"'<\/user>/d
}' cruise-config.xml > output.xml

mv output.xml cruise-config.xml
rm -f output.xml