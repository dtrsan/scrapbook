#!/bin/bash

NAMESPACE="vim"
FILES=( vimrc )
COLORSCHEMES=( solarized.vim )
COLORSCHEMES_DIR=~/.vim/colors

if [ "$DIR" == "" ]; then
    DIR="$( cd -P "$( dirname "$0" )" && pwd )"
fi

for i in ${FILES[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/$i \033[1;32mto \033[1;37m~/.$i\033[0m"
    /usr/bin/install -m 644 $DIR/$i ~/.$i
done

if [ ! -d "$COLORSCHEMES_DIR" ]; then
    mkdir -p "$COLORSCHEMES_DIR"
fi

for i in ${COLORSCHEMES[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/$i \033[1;32mto \033[1;37m~/.vim/colors/$i\033[0m"
    /usr/bin/install -m 644 $DIR/$i ~/.vim/colors/$i
done

