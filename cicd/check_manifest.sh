#!/bin/bash

set -o errexit

if [ -f "manifest.json" ]; then
  echo "Remote manifest found! :)"
  echo "REMOTE_MANIFEST_EXISTS=True" >> "$GITHUB_OUTPUT"
else
  echo "Remote manifest not found! :("
  echo "REMOTE_MANIFEST_EXISTS=False" >> "$GITHUB_OUTPUT"
fi