# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "updating homebrew..."
brew update

binaries=(
  adobe-creative-cloud
  android-sdk
  ansible
  composer
  gcc
  git
  git-flow
  htop-osx
  mackup
  node
  python
  ruby
  ruby-build
  sshfs
  trash
  vagrant
)

echo "installing binaries..."
brew install ${binaries[@]}

echo "installing cask..."
brew install caskroom/cask/brew-cask

# Apps
apps=(
  android-studio
  caffeine
  dropbox
  filezilla
  firefox
  flash
  google-chrome
  google-drive
  iterm2
  skype
  slack
  sourcetree
  spotify
  sublime-text3
  transmission
  vagrant
  virtualbox
  vlc
)

# Install apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

fonts=(
  droid-sans
  droid-sans-mono
  droid-serif
  hack
  roboto
  roboto-mono
  roboto-slab
  sauce-code-powerline
)

echo "tapping fonts..."
brew tap caskroom/fonts

echo "installing fonts..."
brew cask install font-${fonts[@]}