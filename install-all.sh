#! /bin/bash
#
# Links dotfiles, installs oh-my-zsh, and links zsh theme/plugins.

SCRIPT_DIR="$(dirname $0)"

# Install oh-my-zsh
OMZ_FILE=/tmp/oh-my-zsh-install.sh
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh > $OMZ_FILE
chmod +x $OMZ_FILE
eval $OMZ_FILE
rm $OMZ_FILE

# Download oh-my-zsh plugins
mkdir -p $HOME/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Download powerlevel10k zsh theme
mkdir -p $HOME/.oh-my-zsh/custom/themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Link dotfiles
$SCRIPT_DIR/link-dotfiles.sh
