#!/bin/bash

set -e

log(){
  echo "------- $1 -------"
  echo ""
}

WD=$(cd $(dirname $0) && pwd -P)
DOT_FILE_DIR="$WD/dots"
BREW_DIR="$WD/brew"
GEMS_DIR="$WD/gems"
BREW_DIR="$WD/brew"

log "applying dotfiles"

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

log "install required ruby gems"
which bundler || (echo "bundler is not installed, installing..." &&  sudo gem install bundler)
cd $GEMS_DIR
bundle

log "installing brew formulas"

cd $BREW_DIR
brew bundle

log "install required npm packages"
npm install -g pure-prompt

