#! /bin/sh
#
# Links dotfiles into the home directory

FILE=$HOME/.vimrc
# If file exists and is a regular file
if [ -e $FILE ] && [ ! -L $FILE ]; then
    echo "Moving ~/.vimrc to ~/.vimrc.old"
    mv $FILE $FILE.old
fi
# If the file does not exist now
# (either we moved it or it was not there)
if [ ! -e $FILE ]; then
  echo "Linking .$FILE"
  ln -s $(pwd)/vim/vimrc $HOME/.vimrc
fi

FILE=$HOME/.zshrc
# If file exists and is a regular file
if [ -e $FILE ] && [ ! -L $FILE ]; then
    echo "Moving ~/.zshrc to ~/.zshrc.old"
    mv $FILE $FILE.old
fi
# If the file does not exist now
# (either we moved it or it was not there)
if [ ! -e $FILE ]; then
  echo "Linking .$FILE"
  ln -s $(pwd)/zsh/zshrc $HOME/.zshrc
fi

FILE=$HOME/.ideavimrc
# If file exists and is a regular file
if [ -e $FILE ] && [ ! -L $FILE ]; then
    echo "Moving ~/.ideavimrc to ~/.ideavimrc.old"
    mv $FILE $FILE.old
fi
# If the file does not exist now
# (either we moved it or it was not there)
if [ ! -e $FILE ]; then
  echo "Linking .$FILE"
  ln -s $(pwd)/intellij/ideavimrc $HOME/.ideavimrc
fi

