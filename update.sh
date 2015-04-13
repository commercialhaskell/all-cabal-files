#!/bin/bash

set -e
set -x

rm -f 00-index.tar.gz
wget http://hackage.haskell.org/packages/archive/00-index.tar.gz
tar xf 00-index.tar.gz
rm -f 00-index.tar.gz
git add -A
git commit -m "Update from hackage at $(date)"
git push
