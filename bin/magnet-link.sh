#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 magnet-link [destination-dir]"
    exit;
fi

OUTPUT_DIR="."
if [ $# -gt 1 ]; then
    if [ ! -d "$2" ]; then
        echo "Directory \"$2\" does not exist"
        exit
    fi

    OUTPUT_DIR=$2
fi


[[ "$1" =~ xt=urn:btih:([^&/]+) ]] || (echo "Invalid magnet link: $1"; exit)

infohash=${BASH_REMATCH[1]}
if [[ "$1" =~ dn=([^&/]+) ]]; then
    dn=${BASH_REMATCH[1]}
else
    dn=$infohash
fi

echo "d10:magnet-uri${#1}:${1}e" > "$OUTPUT_DIR/meta-$dn.torrent"

