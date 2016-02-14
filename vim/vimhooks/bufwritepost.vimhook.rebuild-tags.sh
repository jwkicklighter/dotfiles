#!/bin/sh
#
# If there is already a tags file in the top-most git repo
# then rebuild the database
tag_file="tags"

cd "$(git rev-parse --show-cdup)"
pwd

if [ -a  $tag_file ]
then
  ctags -R
fi
