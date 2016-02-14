#! /bin/sh
#
# Links dotfiles into the home directory
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'
DIRECTORIES=(vim zsh intellij)

for DIRECTORY in "${DIRECTORIES[@]}"; do
  for FILEPATH in $DIRECTORY/*; do
    FILENAME=`basename $FILEPATH`
    DOTFILE=$HOME/.$FILENAME

    printf "${CYAN}Link .$FILENAME?${NC} "
    read -n 1 -r RESPONSE
    echo

    until [[ $RESPONSE =~ ^[[yY]|[nN]$ ]]; do
      printf "${RED}Please enter y/n${NC}"
      echo; echo
      printf "Link .$FILENAME? (y/n) "
      read -n 1 -r RESPONSE
      echo
    done

    if [[ $RESPONSE =~ ^([yY][eE][sS]|[yY])$ ]]; then
      # If the file exists and is a regular file
      if [ -e $DOTFILE ] && [ ! -L $DOTFILE ]
      then
        echo "Moving ~/.$FILENAME to ~/.$FILENAME.old"
        mv $DOTFILE $DOTFILE.old
      fi

      # If the file does not exist now, or never did
      if [ ! -e $DOTFILE ]
      then
        echo "Linking .$FILENAME..."
        ln -s `pwd`/$FILEPATH $DOTFILE
      fi
    fi
  done
done

