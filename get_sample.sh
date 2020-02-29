#!/bin/sh
set -e

[ -z "$DBX_TOKEN" ] && echo "Error: Please specify an environmental variable DBX_TOKEN" && exit
[ -z "$DBX_PATH" ] && echo "Error: Please specify an environmental variable DBX_PATH" && exit

echo "Retrieving $DBX_PATH..."
curl -X POST https://content.dropboxapi.com/2/files/download_zip \
  --header "Authorization: Bearer $DBX_TOKEN" \
  --header "Dropbox-API-Arg: {\"path\":\"/$DBX_PATH\"}" \
  --output "/data/download.zip" \
  --fail
echo "Success! Downloaded to ./download.zip"