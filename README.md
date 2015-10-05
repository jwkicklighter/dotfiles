This is my collection of dotfiles and configurations.


# Dotfiles (optional)

1. Run `brew/brew-install.sh`
2. Copy `bin` to your home directory
3. Copy `vim/vimrc` to home directory as `.vimrc`
4. Copy `vim/vim/` to home directory as `.vim/`
5. Copy `zsh/zshrc` to home directory as `.zshrc`

# Mackup (prefered)

After having used this system once, backup all dotfiles and configs with Mackup using `mackup backup`. This requires Dropbox (or another supported file syncing app) to work.

On a new machine, after running `brew-install.sh`, simply run `mackup restore`.

# Oh-My-ZSH

1. Run `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"` to install oh-my-zsh
2. Clone this theme somewhere: `Clone this theme: git@github.com:jwkicklighter/oh-my-zsh-powerline-theme.git`
3. Copy powerline.zsh-theme into `.oh-my-zsh/themes/` (install_in_omz.sh should do this)
4. Install `git@github.com:yonchu/grunt-zsh-completion.git` and copy to `.oh-my-zsh/custom/plugins/`
5. Install `git@github.com:zsh-users/zsh-history-substring-search.git` and copy to `.oh-my-zsh/custom/plugins/`
6. Install `git://github.com/zsh-users/zsh-syntax-highlighting.git` and copy to `.oh-my-zsh/custom/plugins/`
7. (optional) Install and set terminal to 1 of these fonts: git@github.com:powerline/fonts.git (I use "12pt Hack" for Refular & "12pt Sauce Code Powerline" for Non-ASCII in iTerm 2)
8. Change default shell to zsh with `chsh -s /bin/zsh`

# OSX For Hackers

There is a modified version of the osx-for-hackers.sh script in `osx/` (original: https://gist.github.com/brandonb927/3195465)

# Sublime Package Syncing
Run `sublime/link-sublime-osx.sh` to symlink the Sublime package files from Dropbox (install Dropbox & Sublime first)