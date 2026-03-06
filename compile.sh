#!/usr/bin/env bash

set -euo pipefail

release_version="${RELEASE_VERSION:-dev}"

for file in translations/*.json; do
  translation="$(basename "$file" .json)"
  typst compile \
    --input jsonFile="$file" \
    --input releaseVersion="$release_version" \
    main.typ \
    "cv-${translation}.pdf"
done
