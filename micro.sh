#!/bin/bash

# Set version/OS
MICRO_VERSION="${1:-2.0.10}"
MICRO_OS="${2:-linux64}"
export MICRO_VERSION MICRO_OS

# Get binary
cd /tmp || exit
wget -q "https://github.com/zyedidia/micro/releases/download/v$MICRO_VERSION/micro-$MICRO_VERSION-$MICRO_OS.tar.gz"
tar xf "micro-$MICRO_VERSION-$MICRO_OS.tar.gz" "micro-$MICRO_VERSION/micro"
sudo mv "micro-$MICRO_VERSION/micro" /usr/local/bin/micro

# Get config
git clone --quiet https://github.com/chessmango/settings.git
mkdir -p ~/.config
cp -r settings/micro ~/.config/micro
sudo mkdir -p ~root/.config
sudo cp -r settings/micro ~root/.config/micro
sudo chown -R root:root ~/root/.config/micro

# Cleanup
rm -r "micro-$MICRO_VERSION" "micro-$MICRO_VERSION-$MICRO_OS.tar.gz"
rm -r settings

echo "Done!"
