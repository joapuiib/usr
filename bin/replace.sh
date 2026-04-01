#!/bin/bash
OLD_STRING=$1
NEW_STRING=$2

if [ -z "$OLD_STRING" ] || [ -z "$NEW_STRING" ]; then
  echo "Usage: $0 <old_string> <new_string>"
  exit 1
fi

grep -rl "$OLD_STRING" . | xargs sed -i "s/$OLD_STRING/$NEW_STRING/g"
