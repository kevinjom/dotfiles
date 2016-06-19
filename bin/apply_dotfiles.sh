#!/bin/bash

set -e

WD=$(cd $(dirname $0) && pwd -P)
DOT_FILE_DIR=$(dirname $WD)/dots

cd $DOT_FILE_DIR

for file in $(find $(pwd) -maxdepth 1 -type f); do
  ln -sf $file ~/.$(basename $file)
done

dirs=$(find $(pwd) -mindepth 1 -maxdepth 1 -type d)

for dir in $dirs; do
  for file in $(find $dir -type f); do
    linked_to=${file:${#DOT_FILE_DIR}}
    ln -sf $file ~/$linked_to
  done
done
