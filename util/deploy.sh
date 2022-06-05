#!/bin/sh

ENVDIR="$1"; [ -z "$ENVDIR" ] && ENVDIR="env"
COPY="$2"

find build -type f,l | sed 's|^build/||' | while read -r file; do
	RPATH="$(realpath "build/$file")"
	DIR="$(dirname "$file")"
	FILE="$(basename "$file")"
	echo $file
	[ -s "$ENVDIR/$file" ] && [ "$RPATH" = "$(readlink "$ENVDIR/$file")" ] && continue
	mkdir -p "$ENVDIR/$DIR"
	echo linking "build/$file -> $ENVDIR/$file"
	ln -sfT "$RPATH" "$ENVDIR/$file"
done
