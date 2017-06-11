#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

function init_brew(){
	echo '
	#################
	# brew install  #
	#################
	'
	echo "## Install Xcode (Depend) Testing"
	echo "! Please Include Xcode packs select !"
	xcode-select --install || true
	echo "sleeping... Please push any key"
	read aksjfiefe
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

function install_brewpacks(){
	# brew list init
	array brewlist

	# cask list init
	array casklist

	#AquaSKK
	array casklist+ aquaskk
	#Screen
	brew tap rcmdnk/rcmdnkpac
	array brewlist+ screenutf8
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
	#depend
	brew cask install xquartz
	array casklist+ inkscape
	array casklist+ blender
	#report
	array casklist+ skim
	array casklist+ libreoffice
	#sshfs
	array casklist+ osxfuse
	array brewlist+ sshfs
	#istat_menus
	array casklist+ istat-menus
	#ranger(file manager)
	array brewlist+ ranger

	#Install
	brew update
	brew install macvim --with-override-system-vim
	brew install ${brewlist[*]}
	brew cask install ${casklist[*]}
}

function install_maspacks(){
	#appstore-files
	# BoxySVG
	mas install 611658502
	# OneDrive
	mas install 823766827
	# Xcode
	#mas install 497799835
}

function install_go(){
	mkdir ~/go
	brew install go
	#echo "export GOPATH=~/go" >> ~/.bashrc
	#echo "export PATH=$PATH:/$GOPATH/bin" >> ~/.bashrc
}

function install_pips(){
	sudo easy_install pip
	sudo pip install tensorflow
	# or gpu
	# pip install tensorflow-gpu
	pip install virtualenv
	pip install pyenv
}

function install_texlive(){
	# Heavy Package
	brew cask install mactex
	brew install pandoc
	# additional 
	# https://snap.textfile.org/20151006085255/
}

function backup_maspacks(){
	mas list > brew_appstore-`date '+%Y%m%d'`
}

function do_yourself(){
	echo'
	before:
	Download this files
	Install Xcode
	After:
	Open Google/One Drive
	Set GOPATH/PATH for go
	Terminal Setting
	Google Chrome setting
	Docker startup+Docker mem&cpu setting change
	reboot for complete to aquqskk init
	sudo tlmgr update --self --all
	'
}

if [ "$1" = "init" ]
then
	#init_brew
	#install_maspacks
	#install_brewpacks

	install_texlive
	# !testing
	#install_go
	#install_pips
	echo '
	################
	# Init OK      #
	################
	'
	exit
fi

