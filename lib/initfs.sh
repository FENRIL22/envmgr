#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

format_dics(){
	mkdir ~/OneDrive
	#mkdir env
	mkdir -p ~/dev/chamber
}

init_envfiles(){
	cd ~/env
	git clone https://github.com/FENRIL22/envmgr.git
	git clone https://github.com/FENRIL22/dotfiles.git
	(cd dotfiles; make init)
}

init_devfiles(){
	cd ~/dev
	git clone https://github.com/FENRIL22/lapatex.git
	git clone https://github.com/FENRIL22/y-toolset.git
}


#if [ "$1" = "init" ]
#then
#	#format_dics
#	echo '
#	################
#	# Init OK      #
#	################
#	'
#	exit
#fi

echo '
###################
#                 #
#  initializer    #
#                 #
###################
'


# Todo: run automatically by using curl.
#format_dics
#init_devfiles
#init_envfiles

