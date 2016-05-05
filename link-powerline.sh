#! /bin/sh
#
# Links powerline theme into oh-my-zsh custom themes directory.

echo "Linking .$FILENAME..."
ln -s `pwd`/powerline.zsh-theme $HOME/.oh-my-zsh/custom/themes/powerline.zsh-theme
