#!/bin/bash

MICRO_VERSION="${1:-2.0.10}"
MICRO_OS="${2:-linux64}"
export MICRO_VERSION MICRO_OS

wget "https://github.com/zyedidia/micro/releases/download/v$MICRO_VERSION/micro-$MICRO_VERSION-$MICRO_OS.tar.gz"
tar xf "micro-$MICRO_VERSION-$MICRO_OS.tar.gz" "micro-$MICRO_VERSION/micro"
sudo mv "micro-$MICRO_VERSION/micro" /usr/local/bin/micro
rm -r "micro-$MICRO_VERSION"
