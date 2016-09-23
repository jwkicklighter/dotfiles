#!/bin/sh
#
# The MIT License (MIT)
#
# Copyright (c) 2015-2016 Stefan Tatschner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

buildroot="$(mktemp -d)"

# Ask for user passwort once, see sudo(8).
sudo -v

# Make sure we can even build packages on arch linux.
sudo pacman -S --needed --noconfirm base-devel git

mkdir -p "$buildroot"
cd "$buildroot" || exit 1

# Arch Linux ARM provides a cower package for the RPI!
# Let's either install 'cower' via pacman, or build it.
if [ "$(uname -n)" = 'alarmpi' ]; then
	pacman -S cower
else
	# Fetch Dave Reisner's key to be able to verify cower.
	gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 487EACC08557AD082088DABA1EB2638FF56C0C53
	git clone "https://aur.archlinux.org/cower.git"
	cd "${buildroot}/cower" || exit 1
	makepkg --syncdeps --install --noconfirm
fi

git clone "https://aur.archlinux.org/pacaur.git"

cd "${buildroot}/pacaur" || exit 1
makepkg --syncdeps --install --noconfirm

cd "$HOME" || exit 1
rm -rf "$buildroot"
