#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

format_dics(){
	mkdir ~/OneDrive || true
	#mkdir env
	mkdir -p ~/dev/chamber || true
	mkdir ~/docs || true
	mkdir -p ~/fs/mnt || true
}

init_envfiles(){
	cd ~/env
	git clone https://github.com/FENRIL22/envmgr.git || true
	git clone https://github.com/FENRIL22/dotfiles.git
	(cd dotfiles; make init)
	git clone https://FENRIL22@bitbucket.org/FENRIL22/secure_vars.git
}

init_devfiles(){
	cd ~/dev
	git clone https://github.com/FENRIL22/lapatex.git
	git clone https://github.com/FENRIL22/y-toolset.git
	git clone https://FENRIL22@bitbucket.org/FENRIL22/chamber.git
}

init_docfiles(){
	cd ~/docs
	git clone https://FENRIL22@bitbucket.org/FENRIL22/univ_m_2017.git
	git clone https://FENRIL22@bitbucket.org/FENRIL22/univ_research.git
}

if [ "$1" = "format_dics" ]
then
	format_dics
	echo '
	################
	# Init OK      #
	################
	'
	exit
fi

if [ "$1" = "init_devfiles" ]
then
	init_devfiles
	echo '
	################
	# Init OK      #
	################
	'
	exit
fi

if [ "$1" = "init_envfiles" ]
then
	init_envfiles
	echo '
	################
	# Init OK      #
	################
	'
	exit
fi

if [ "$1" = "init_docfiles" ]
then
	init_docfiles
	echo '
	################
	# Init OK      #
	################
	'
	exit
fi

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
