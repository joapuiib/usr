#!/usr/bin/env bash

PROCESS_NAME="Dofus.x64"

pids=$(pgrep -f "$PROCESS_NAME")

if [[ -z "$pids" ]]; then
  echo "No process found matching $PROCESS_NAME"
  exit 0
fi

echo "Killing process(es): $pids"
kill -9 $pids
