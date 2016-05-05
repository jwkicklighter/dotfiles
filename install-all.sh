#! /bin/sh
#
# Links dotfiles, installs oh-my-zsh, and links zsh theme/plugins.

SCRIPT_DIR="$(dirname $0)"

# Link dotfiles
$SCRIPT_DIR/link-dotfiles.sh

# Install oh-my-zsh
sh -c $(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)

# Link powerline theme
$SCRIPT_DIR/link-powerline.sh

# Download oh-my-zsh plugins
mkdir -p $HOME/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install Vundle
mkdir -p $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
