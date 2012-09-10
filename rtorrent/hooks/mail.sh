#!/bin/sh

EMAIL=dtrsan@localhost

echo "$(date) : $1 - Download completed." | mail -s "[rtorrent] - Download completed : $1" $EMAIL

