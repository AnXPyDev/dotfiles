#!/bin/sh

CC=$1

if test -z "$CC"; then
	CC=gcc
fi

$CC -O2 src/cycle.c -o bin/cycle

$CC -O2 src/xrdbget.c -lX11 -o bin/xrdbget
