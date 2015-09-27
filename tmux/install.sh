#!/bin/bash

NAMESPACE="tmux"
FILES=( tmux.conf )

TPM_DIR='.tmux/plugins/tpm'
TPM_URL='git://github.com/tmux-plugins/tpm'

if [ ! -d "/$HOME/$TPM_DIR" ]; then
    echo -e "\033[1;32m-> installing \033[1;37mtpm \033[1;32mto \033[1;37m~/$TPM_DIR\033[0m"
    git clone $TPM_URL ~/$TPM_DIR
fi

if [ "$DIR" == "" ]; then
    DIR="$( cd -P "$( dirname "$0" )" && pwd )"
fi

for i in ${FILES[@]}; do
    echo -e "\033[1;32m-> installing \033[1;37m$NAMESPACE/$i \033[1;32mto \033[1;37m~/.$i\033[0m"
    /usr/bin/install -m 644 $DIR/$i ~/.$i
done

