#!/bin/bash
set -eu

initialize(){
	./bin/brew.sh init
}
	
if [ "$#" = 0 ]
then
	echo "usage   : make [option]"
	echo "< options >"
	echo "init    : initialize files"
	echo "update  : update files"
	exit
fi

if [ "$1" = "init" ]
then
	initialize
	exit
fi


