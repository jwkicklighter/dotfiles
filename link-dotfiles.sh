#! /bin/sh
#
# Links dotfiles into the home directory

DIRECTORIES=(vim zsh intellij)

for DIRECTORY in "${DIRECTORIES[@]}"; do
  for FILEPATH in $DIRECTORY/*; do
    FILENAME=`basename $FILEPATH`
    DOTFILE=$HOME/.$FILENAME

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
  done
done

