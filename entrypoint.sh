#!/bin/sh

if [ "$#" -lt 2 ]; then
  echo "Usage: <output filename> <pip package> [pip package] ... [pip package]"
  exit 1
fi

OUTPUT_FILENAME=$1
shift

python3 -m pip install "$@"
venv-pack -o /output/$OUTPUT_FILENAME --python-prefix /home/hadoop/environment
