#!/bin/bash

if [ "$#" -lt 1 ]; then
  exit 1
fi

for file in "$@"; do
  if [ -f "$file" ]; then
    yaml2toml "$file" "${file%.yaml}.toml"
  fi 
done

