#!/bin/sh

HEADER=$(mktemp)
MAIN=$(mktemp)

RDIR="$(realpath source | sed -E 's|(\s)|\\\\\1|g')"

find source -type d | sed -E 's|^source||;s|(\s)|\\\\\1|g' | while read -r dir; do
	printf "build$dir/:\n\tmkdir -p build$dir\n\n" >> $MAIN
done

find source -type f | while read -r file; do
	DIR="$(dirname "$file" | sed -E 's|^source||;s|(\s)|\\\\\1|g')"
	FILE="$(basename "$file" | sed -E 's|^source||;s|(\s)|\\\\\1|g')"
	DF="$DIR/$FILE"
	printf "build$DF: | source$DF build$DIR/\n\tln -s $RDIR$DF build$DF\n\n" >> $MAIN
done

printf 'compile: ' >> $HEADER
find source -type f | sed 's|^source|build|' | sed -z 's|\n| |g' >> $HEADER
printf '\n\n' >> $HEADER


cat $HEADER $MAIN > compile.make
