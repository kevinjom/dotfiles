#!/bin/bash

WD=$(cd $(dirname $0) && pwd -P)
BREW_DIR=$(dirname $WD)/brew
FORMULAS_FILE=$BREW_DIR/formulas
LOG_FILE=$BREW_DIR/error.log
INSTALLED_FORMULAS=$BREW_DIR/installed.log

rm -f $LOG_FILE
brew list > $INSTALLED_FORMULAS

echo "You have got these formulas installed"
cat $INSTALLED_FORMULAS | sort

INSTALLABLE=$(comm -23 $FORMULAS_FILE $INSTALLED_FORMULAS)

[[ -z $INSTALLABLE ]] && echo "Everything is update to date" && exit 0

echo "These formuals are ready to install..."
echo $INSTALLABLE

echo $INSTALLABLE | xargs brew install 2>> $LOG_FILE

cat $LOG_FILE

echo "All new formulas installed."

