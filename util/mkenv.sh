#!/bin/sh

ORIGIN="$1"; [ -z "$ORIGIN" ] && ORIGIN="$HOME"
ENVDIR="$2"; [ -z "$ENVDIR" ] && ENVDIR="env"
PATHS="$3"; [ -z "$PATHS" ] && PATHS="env.paths"


sed 's| -> |\n|' "$PATHS" | while read -r orig; read -r link; do
	echo "linking $orig -> $link"
	[ ! -d "$ORIGIN/$orig" ] && mkdir -p "$ORIGIN/$orig"
	mkdir -p "$(dirname "$ENVDIR/$link")"
	ln -sfT "$(realpath "$ORIGIN/$orig")" "$ENVDIR/$link"
done
