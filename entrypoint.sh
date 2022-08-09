#!/bin/sh
set -e
USERNAME="${1:-$INPUT_USERNAME}"
TOKEN="${2:-$INPUT_TOKEN}"
URL="${3:-$INPUT_URL}"
if [ -z "$USERNAME" ] || [ -z "$TOKEN" ] || [ -z "$URL" ]; then
  echo "Usage: $0 [USERNAME [TOKEN [URL]]]"
  echo ""
  echo "Arguments can also be passed as variables using INPUT_ as prefix."
  exit 1
fi
kyso login --kysoInstallUrl "$URL" --provider "kyso" --username "$USERNAME" \
  --token "$TOKEN"
kyso push
