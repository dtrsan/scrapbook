#!/bin/bash

NAMESPACE="ssh"
FILES=( config )

if [ "$DIR" == "" ]; then
    DIR="$( cd -P "$( dirname "$0" )" && pwd )"
fi


echo -e "\033[1;32m-> creating directory \033[1;37m~/.$NAMESPACE\033[0m"
install -d -m 700 ~/.$NAMESPACE

for i in ${FILES[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/$i \033[1;32mto \033[1;37m~/.$NAMESPACE/$i\033[0m"
    /usr/bin/install -m 600 $DIR/$i ~/.$NAMESPACE/$i
done

