#!/usr/bin/env bash
#channel=$1
version=$(curl -sX GET "https://api.github.com/repos/mdsina/Sonarr/releases" | jq --raw-output 'map(select(.prerelease)) | first | .tag_name' 2>/dev/null)
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
