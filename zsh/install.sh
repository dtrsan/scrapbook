#!/bin/bash

NAMESPACE="zsh"
FILES=( zshrc )
THEMES=( trsan )
PLUGINS=( colordiff mailcheck )
CUSTOMS=( aliases )

OH_MY_ZSH_DIR='.oh-my-zsh'
OH_MY_ZSH_URL='git://github.com/robbyrussell/oh-my-zsh.git'

if [ ! -d "/$HOME/$OH_MY_ZSH_DIR" ]; then
    echo -e "\033[1;32m-> installing \033[1;37moh-my-zsh \033[1;32mto \033[1;37m~/$OH_MY_ZSH_DIR\033[0m"
    git clone $OH_MY_ZSH_URL ~/$OH_MY_ZSH_DIR
fi

if [ "$DIR" == "" ]; then
    DIR="$( cd -P "$( dirname "$0" )" && pwd )"
fi

for i in ${PLUGINS[@]}; do
    echo -e "\033[1;32m-> installing plugin \033[1;37m$NAMESPACE/${i}\033[0m"
    /bin/mkdir -p -m 755 ~/$OH_MY_ZSH_DIR/custom/plugins/${i}
    /usr/bin/install -m 644 $DIR/${i}.plugin.zsh ~/$OH_MY_ZSH_DIR/custom/plugins/${i}/${i}.plugin.zsh
done

for i in ${THEMES[@]}; do
    echo -e "\033[1;32m-> installing theme \033[1;37m$NAMESPACE/${i}\033[0m"
    /usr/bin/install -m 644 $DIR/${i}.zsh-theme ~/$OH_MY_ZSH_DIR/themes/${i}.zsh-theme
done

for i in ${CUSTOMS[@]}; do
    echo -e "\033[1;32m-> installing custom configuration \033[1;37m$NAMESPACE/${i}\033[0m"
    /usr/bin/install -m 644 $DIR/${i}.zsh ~/$OH_MY_ZSH_DIR/custom/${i}.zsh
done

for i in ${FILES[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/$i \033[1;32mto \033[1;37m~/.$i\033[0m"
    /usr/bin/install -m 644 $DIR/$i ~/.$i
done

