#!/bin/bash

NAMESPACE="transmission-daemon"
FILES=( settings.json )

CONFIG_DIR=".config/transmission-daemon"
if [ $(uname) == "Darwin" ]; then
    CONFIG_DIR="Library/Application Support/transmission-daemon"
fi
DIRS=( Downloads/Transmission Downloads/Transmission/.incomplete Downloads/Torrents "${CONFIG_DIR}")

if [ "$DIR" == "" ]; then
    DIR="$( cd -P "$( dirname "$0" )" && pwd )"
fi

for ((i = 0; i < ${#DIRS[@]}; i++)); do
    dir="${DIRS[$i]}"
    if [ ! -d ~/"${dir}" ]; then
        echo -e "\033[1;32m-> creating directory \033[1;37m~/"${dir}"\033[0m"
        install -d -m 755 ~/"${dir}"
    fi
done

for i in ${FILES[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/$i \033[1;32mto \033[1;37m~/"${CONFIG_DIR}"/$i\033[0m"
    /usr/bin/install -m 600 $DIR/$i ~/"${CONFIG_DIR}"/$i
done

