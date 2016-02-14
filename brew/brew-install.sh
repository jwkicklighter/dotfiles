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
  android-sdk
  ansible
  composer
  ctags
  gcc
  git
  git-flow
  heroku-toolbelt
  htop-osx
  macvim
  node
  postgresql
  qt5
  ruby
  ruby-build
  sshfs
  sslmate
  trash
  vagrant
  vim
)

echo "installing binaries..."
brew install ${binaries[@]}
