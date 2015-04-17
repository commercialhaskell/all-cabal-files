#!/bin/bash

set -e
set -x

DIR=$HOME/.cabal/packages/hackage.haskell.org
TAR=$DIR/00-index.tar
TARGZ=$TAR.gz

mkdir -p "$DIR"

rm -f $TAR $TARGZ

git archive --format=tar -o "$TAR" master
gzip -k "$TAR"
