#!/bin/bash

if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Must be run as super-user root!"
    exit 1
fi

EMAIL=dtrsan@localhost
TMPSELFUPDATE=$(mktemp /tmp/macports.selfupdate.XXX)
TMPOUTDATED=$(mktemp /tmp/macports.outdated.XXX)

port selfupdate &> $TMPSELFUPDATE
echo "" >> $TMPSELFUPDATE
port echo outdated &> $TMPOUTDATED

INSTALLED_VERSION=$(grep "^MacPorts base version .* installed,$" $TMPSELFUPDATE | cut -d' ' -f4)
DOWNLOADED_VERSION=$(grep "^MacPorts base version .* downloaded.$" $TMPSELFUPDATE | cut -d' ' -f4)

if [ -s $TMPOUTDATED ]; then
    cat $TMPSELFUPDATE $TMPOUTDATED | mail -s "New macports updates available" $EMAIL

elif [ $INSTALLED_VERSION != $DOWNLOADED_VERSION ]; then
    cat $TMPSELFUPDATE | mail -s "MacPorts base updated" $EMAIL
fi

rm -f $TMPSELFUPDATE
rm -f $TMPOUTDATED

