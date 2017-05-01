#!/bin/bash

NAMESPACE="newsbeuter"
FILES=( colors-solarized-dark config )

if [ "$DIR" == "" ]; then
    DIR="$( cd -P "$( dirname "$0" )" && pwd )"
fi

for i in ${FILES[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/$i \033[1;32mto \033[1;37m~/.$NAMESPACE/$i\033[0m"
    /usr/bin/install -D -m 644 $DIR/$i ~/.$NAMESPACE/$i
done

