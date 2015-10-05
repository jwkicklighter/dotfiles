#! /bin/sh
#
# Links sublime files from Dropbox to Mac Library directory.

red='\033[0;31m'

# Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
# sudo -v
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cecho "Are Dropbox and Sublime Text 3 installed? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

  echo "What folder is Dropbox syncing? (~/Dropbox/)"
  read dropbox_folder
  if [ -z "$1" ]; then
    $dropbox_folder = "~/Dropbox"
  fi

  ln -s "$dropbox_folder/Sublime Files/Installed Packages" "Installed Packages"
  ln -s "$dropbox_folder/Sublime Files/Packages/User" "Packages/User"

fi