#! /bin/sh
#
# Links powerline theme into oh-my-zsh custom themes directory.

echo "Linking .$FILENAME..."
mkdir -p $HOME/.oh-my-zsh/custom/themes
ln -s `pwd`/powerline.zsh-theme $HOME/.oh-my-zsh/custom/themes/powerline.zsh-theme
