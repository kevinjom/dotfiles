#!/bin/bash

set -e

WD=$(cd $(dirname $0) && pwd -P)
DOT_FILE_DIR=$(dirname $WD)

cd "$DOT_FILE_DIR/dots"

if [ -f gituser ];then
  cat gituser > gitconfig
  cat gitconfig_shared >> gitconfig
else
  cat gitconfig_shared > gitconfig
fi


for file in $(find $(pwd) -maxdepth 1 -type f); do
  ln -sf $file ~/.$(basename $file)
done

