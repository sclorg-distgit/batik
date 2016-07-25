#!/bin/bash

set -e

tmp=$(mktemp -d)

trap cleanup EXIT
cleanup() {
    set +e
    [ -z "$tmp" -o ! -d "$tmp" ] || rm -rf "$tmp"
}

unset CDPATH
pwd=$(pwd)
ver=1.8pre

cd "$tmp"
unzip -qq "$pwd"/batik-src-$ver.zip
rm -rf `find -name *.jar`
zip  -9 -o -r -q "$pwd"/batik-repack-$ver.zip batik-$ver
touch -r "$pwd"/batik-src-$ver.zip "$pwd"/batik-repack-$ver.zip
cd - >/dev/null
