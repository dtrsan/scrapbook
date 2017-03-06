#!/bin/bash

DST=~/.certs
CERT_FILE="$DST/localhost.pem"

if [ ! -d "$DST" ]; then
    mkdir -p "$DST"
fi

if [ -f "$CERT_FILE" ]; then
    echo "Do you want to overwrite '$CERT_FILE' file?"
    echo "Press 'y' to confirm."
    read -n 1 answer
    echo ""
    if [[ "x$answer" != "xy" ]]; then
        echo "Quitting..."
        exit
    fi
fi

openssl req -new -x509 \
    -newkey rsa:4096 \
    -keyout "$CERT_FILE" \
    -out "$CERT_FILE" \
    -days 7 -nodes

echo "Done"

