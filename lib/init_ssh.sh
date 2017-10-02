#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa
echo "please copy & Paste to github"
echo "============"
cat ~/.ssh/id_rsa.pub

echo "============"
read -p "Hit enter to Next: "
