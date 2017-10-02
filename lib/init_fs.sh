#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

mkdir ~/OneDrive || true
mkdir env || true
mkdir -p ~/dev/chamber || true
mkdir ~/docs || true
mkdir -p ~/fs/mnt || true
mkdir ~/env || true
