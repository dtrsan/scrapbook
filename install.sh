#!/bin/bash

SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"
NAMESPACES=( bash colordiff git gvim htop mercurial most postgresql rtorrent screen ssh synergy vim )

INSTALL=()

if [ $# -gt 0 ]
then
  for arg in $*
  do
    INSTALL[${#INSTALL[*]}]=$arg
  done
else
  INSTALL=("${NAMESPACES[@]}")
fi

for ns in ${INSTALL[@]}
do
  echo -e "\033[1;32mTrying to install \033[1;93m$ns \033[1;32mconfiguration files...\033[0m"
  DIR=$SCRIPT_DIR/$ns
  INSTALL_SCRIPT=$DIR/install.sh
  if [ -x $INSTALL_SCRIPT ]
  then
    . $INSTALL_SCRIPT
    echo -e "\033[1;93m$ns \033[1;32mconfiguration files installed\033[0m\n"
  else
    echo -e "\033[1;31mCannot found \033[1;93m$ns\033[1;31m. Maybe you misspelled it?\033[0m\n"
  fi

done

exit 0

