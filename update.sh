#!/bin/bash

set -x
set -e

rm -f 00-index.tar.gz
wget https://hackage.haskell.org/packages/archive/00-index.tar.gz
tar xf 00-index.tar.gz
rm -f 00-index.tar.gz

if [ -n "$(git status --porcelain)" ]
then
    git add -A
    git config --global core.autocrlf input
    git commit -m "Update from Hackage at $(date --utc --iso=sec)" --gpg-sign=D6CF60FD
    git pull --rebase
    git push git@github.com:commercialhaskell/all-cabal-files.git HEAD:master
    git push git@github.com:commercialhaskell/all-cabal-files.git HEAD:hackage

    git tag current-hackage -u D6CF60FD -m "Update from Hackage at $(date --utc --iso=sec)" -f
    git push git@github.com:commercialhaskell/all-cabal-files.git --tags --force
else
    echo No changes present
fi
