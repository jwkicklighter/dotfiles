#! /bin/sh
#
# Links dotfiles into the home directory

FILE=$HOME/.vimrc
if [ -a $FILE ]
  then
    echo "Moving ~/.vimrc to ~/.vimrc.old"
    mv $FILE $FILE.old
fi
ln -s $(pwd)/vim/vimrc $HOME/.vimrc

FILE=$HOME/.zshrc
if [ -a $FILE ]
  then
    echo "Moving ~/.zshrc to ~/.zshrc.old"
    mv $FILE $FILE.old
fi
ln -s $(pwd)/zsh/zshrc $HOME/.zshrc
