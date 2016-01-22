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
