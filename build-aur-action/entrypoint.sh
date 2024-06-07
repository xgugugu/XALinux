#!/bin/bash

REPOS=('xascience-xacraft')

set -e

mkdir ./dist/

for REPO in "${REPOS[@]}"; do
    cd "$REPO"
    makepkg -sf --noconfirm
    pacman -U --noconfirm ./*.pkg.tar.zst
    mv ./*.pkg.tar.zst "../dist/$REPO.pkg.tar.zst"
    cd ..
done

repo-add ./dist/xascience.db.tar.gz ./dist/*.pkg.tar.zst || true
