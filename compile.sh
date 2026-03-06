#!/usr/bin/env bash

set -euo pipefail

for file in translations/*.json; do
  translation="$(basename "$file" .json)"
  typst compile --input jsonFile="$file" main.typ "cv-${translation}.pdf"
done
