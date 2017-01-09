# Dotfiles

This is my collection of dotfiles and configurations.

**Note: I AM NOT RESPONSIBLE IF:**

1. Your computer runs away from home.
2. Your dog wakes up at 2:00am howling at your CPU.
3. Your laptop becomes sentient and enslaves the human race.
4. These scripts don't quite work right.

## NEW INSTALL METHOD

Run `install-all.sh` and pray.

**NOTE** For the time being, oh-my-zsh will start a zsh session in the middle of the install script. Type `exit` to finish linking everything, and then start a new session to see everything linked and ready to go.

Run `install-pacaur.sh` on Arch systems to get pacaur up and running.

Run `install-plug.sh` to install Plug for vim. Inside of vim, run `PlugInstall` to install the plugins.

Run `install-plug-nvim.sh` to install Plug for nvim. Inside of nvim, run `PlugInstall` to install the plugins.

## OLD INSTALL METHOD

### Link Dotfiles (optional)

Run `link-dotfiles.sh`. This script will check for the default dotfiles and back them up if they exist. If you run the script after already having some of the files symlinked (e.g. to link a dotfile that has been added recently) it will not do anything to the symlink or backup that already exist.

### Install homebrew and some helpful packages (optional)

Run `brew-install.sh`. If you are curious what binaries will be installed, check out the array in that file.

### Oh-My-ZSH

1. Run `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"` to install oh-my-zsh
2. Clone this theme somewhere: `Clone this theme: git@github.com:jwkicklighter/oh-my-zsh-powerline-theme.git`
3. Copy powerline.zsh-theme into `.oh-my-zsh/themes/` (install_in_omz.sh should do this)
4. Install `git@github.com:yonchu/grunt-zsh-completion.git` and copy to `.oh-my-zsh/custom/plugins/`
5. Install `git://github.com/zsh-users/zsh-syntax-highlighting.git` and copy to `.oh-my-zsh/custom/plugins/`
6. (optional) Install and set terminal to 1 of these fonts: `git@github.com:powerline/fonts.git` (I use "12pt Hack" for Refular & "12pt Sauce Code Powerline" for Non-ASCII in iTerm 2)

## OSX For Hackers

There is a modified version of the osx-for-hackers.sh script in `osx/` (original: https://gist.github.com/brandonb927/3195465)

## Vimrc/Ideavimrc

My .vimrc assumes that you have Plug installed. If you followed all the instructions, you will have it installed for Vim or Neovim. The .ideavimrc is for the JetBrains IdeaVim plugin, and is read by any of their editors that have the plugin installed.
