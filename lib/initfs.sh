#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

format_dics(){
	mkdir ~/OneDrive
	#mkdir env
	mkdir -p ~/dev/chamber
	mkdir docs
}

init_envfiles(){
	cd ~/env
	git clone https://github.com/FENRIL22/envmgr.git
	git clone https://github.com/FENRIL22/dotfiles.git
	(cd dotfiles; make init)
	git clone https://FENRIL22@bitbucket.org/FENRIL22/secure_vars.git
}

init_devfiles(){
	cd ~/dev
	git clone https://github.com/FENRIL22/lapatex.git
	git clone https://github.com/FENRIL22/y-toolset.git
}

init_docfiles(){
	git clone https://FENRIL22@bitbucket.org/FENRIL22/univ_m_2017.git
	git clone https://FENRIL22@bitbucket.org/FENRIL22/univ_research.git


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

