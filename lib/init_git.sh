#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

echo "sample:"
echo "git config --global user.name nabnab"
echo "git config --global user.email hoge@gmail.com"
