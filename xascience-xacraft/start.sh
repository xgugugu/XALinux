#!/usr/bin/env bash
set -e

if [ ! -d "$HOME/.XAScience/XACRAFT/" ]; then
  mkdir -p "$HOME/.XAScience/XACRAFT/"
fi

cd "$HOME/.XAScience/XACRAFT/"

if [ ! -f "./.xterm-fallback-flags" ]; then
  echo "-fa Consolas -fs 12 -cjk_width" >>./.xterm-fallback-flags
fi
read -ra XTERM_FALLBACK_FLAGS <<<"$(cat "./.xterm-fallback-flags")"

xterm /usr/lib/xascience-xacraft/XACRAFT "${XTERM_FALLBACK_FLAGS[@]}"
