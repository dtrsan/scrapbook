#!/bin/bash

NAMESPACE="rtorrent"
FILES=( rtorrent.rc )
HOOKS_DIR=".rtorrent/hooks"
HOOKS=( mail.sh )
DIRS=( $HOOKS_DIR .rtorrent/session Downloads/rtorrent/completed Downloads/rtorrent/incomplete )


if [ "$DIR" == "" ]; then
    DIR="$( cd -P "$( dirname "$0" )" && pwd )"
fi

for i in ${FILES[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/$i \033[1;32mto \033[1;37m~/.$i\033[0m"
    /usr/bin/install -m 644 $DIR/$i ~/.$i
done


for dir in ${DIRS[@]}; do
    if [ ! -d ~/$dir ]; then
        echo -e "\033[1;32m-> creating directory \033[1;37m~/$dir\033[0m"
        install -d -m 755 ~/$dir
    fi
done

for i in ${HOOKS[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/hooks/$i \033[1;32mto \033[1;37m~/$HOOKS_DIR/$i\033[0m"
    /usr/bin/install -m 755 $DIR/hooks/$i ~/$HOOKS_DIR/$i
done

