#!/usr/bin/env bash

set -euo pipefail

npm install -g ajv-cli
npx ajv validate -s content/translations-schema.yaml -d "content/translations/*.yaml" --spec=draft7 --errors=text
npx ajv validate -s content/general-schema.yaml -d content/general.yaml --spec=draft7 --errors=text
