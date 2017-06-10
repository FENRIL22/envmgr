#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

if [ "$1" = "init" ]
then
	mkdir ~/.ssh
	cd ~/.ssh
	
	ssh-keygen -t rsa 
	cat ~/.ssh/id_rsa.pub | pbcopy

	echo "Generate Key copy to clipboard"

	echo '
	################
	# Init OK      #
	################
	'
	exit
fi

