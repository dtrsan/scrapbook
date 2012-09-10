#!/bin/bash

VLC=/Applications/VLC.app/Contents/MacOS/VLC

$VLC -I ncurses --sout='#http{mux=ogg,dst=:60666/}' --no-sout-rtp-sap --no-sout-standard-sap --ttl=1 --sout-keep

