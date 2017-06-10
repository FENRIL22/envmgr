#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

function init_brew{
	echo "#################"
	echo "# brew install  #"
	echo "#################"
	echo ""
	echo "## Install Xcode (Depend) Testing"
	echo "! Please Include Xcode packs select !"
	xcode-select --install || true
	sudo xcodebuild -license accept

	echo "## install brew basesystem"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	
	echo ""
	echo "## Install brew extra"
	echo ""
	brew tap caskroom/cask
	brew install argon/mas/mas
	#brew install rcmdnk/file/brew-file
}

function install_brewpacks{
	# brew list init
	array brewlist

	# cask list init
	array casklist

	#google
	array casklist+ google-drive
	array casklist+ google-chrome
	#slack
	array casklist+ slack
	#vm
	array casklist+ docker
	array casklist+ virtualbox
	#entertain
	array casklist+ gimp
	array casklist+ inkscape
	array casklist+ blender
	#report
	array casklist+ skim
	array casklist+ libreoffice
	#sshfs
	array casklist+ osxfuse
	array brewlist+ sshfs

	#Install
	brew update
	brew install macvim --with-override-system-vim
	brew install ${brewlist[*]}
	brew cask install ${casklist[*]}
}

function install_texlive{
	# Heavy Package
	brew cask install mactex
	sudo tlmgr update --self --all
	# additional 
	# https://snap.textfile.org/20151006085255/
}

function install_pips{
	easy_install pip
	pip install tensorflow
	# or gpu
	# pip install tensorflow-gpu
	pip install virtualenv
	pip install pyenv
}

function install_maspacks{
	#appstore-files
	#brew file install brew-appstore
}

function backup_maspacks{
	mas list > brew_appstore-`date '+%Y%m%d'`
}

if [ "$1" = "init" ]
then
	#init_brew
	install_brewpacks
	exit
fi

