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
	git clone git@github.com:FENRIL22/envmgr.git
	git clone git@github.com:FENRIL22/dotfiles.git
	(cd dotfiles; make init)
	git clone git@bitbucket.org:FENRIL22/secure_vars.git
}

init_devfiles(){
	cd ~/dev
	git clone git@github.com:FENRIL22/lapatex.git
	git clone git@github.com:FENRIL22/y-toolset.git
	git clone git@bitbucket.org:FENRIL22/chamber.git
}

init_docfiles(){
	cd ~/docs
	git clone git@bitbucket.org:FENRIL22/univ_m_2017.git
	git clone git@bitbucket.org:FENRIL22/univ_research.git
}

echo '
###################
#                 #
#  initializer    #
#                 #
###################

Do you want to do?

'

FDIC="format_dics"
IDEV="init_devfiles"
IENV="init_envfiles"
IDOC="init_docfiles" 
ALL="ALL"

select ARG in ${FDIC} ${IDEV} ${IENV} ${IDOC} ${ALL}
do
	if [ -z "${ARG}" ]
	then
		echo "invalid vars"

	elif [ ${ARG} = "format_dics" ]
	then
		echo "---init start ${ARG}...--------"
		format_dics
		echo '
		################
		# dic Init OK  #
		################
		'

	elif [ ${ARG} = "init_devfiles" ]
	then
		echo "---init start ${ARG}...--------"
		init_devfiles
		echo '
		################
		# dev Init OK  #
		################
		'

	elif [ ${ARG} = "init_envfiles" ]
	then
		echo "---init start ${ARG}...--------"
		init_envfiles
		echo '
		################
		# ENV Init OK  #
		################
		'

	elif [ ${ARG} = "init_docfiles" ]
	then
		echo "---init start ${ARG}...--------"
		init_docfiles
		echo '
		################
		# Init OK      #
		################
		'

	elif [ ${ARG} = "all" ]
	then
		echo '
		################
		# Start Init   #
		################
		'
		format_dics
		init_devfiles
		init_docfiles
		init_envfiles
		echo '
		################
		# Init OK      #
		################
		'

	else
		echo "unrecognize option"
	fi
done



# Todo: run automatically by using curl.
#format_dics
#init_devfiles
#init_envfiles
