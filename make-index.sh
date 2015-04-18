#! /usr/bin/env bash

set -eu
set -x

DIR=$HOME/.cabal/packages/hackage.haskell.org
TAR=$DIR/00-index.tar
TARGZ=$TAR.gz

mkdir -p "$DIR"

rm -f "$TAR" "$TARGZ"

git archive --format=tar -o "$TAR" HEAD
gzip -k "$TAR"
