#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

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
	git clone git@bitbucket.org:FENRIL22/univ_m_2017_ai.git
	git clone git@bitbucket.org:FENRIL22/univ_m_2017_alg.git
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

IDEV="init_devfiles"
IENV="init_envfiles"

select ARG in ${IDEV} ${IENV}
do
	if [ -z "${ARG}" ]
	then
		echo "invalid vars"

	elif [ ${ARG} = "init_devfiles" ]
	then
		echo "---init start ${ARG}...--------"
		init_devfiles
		echo '
		################
		# dev Init OK  #
		################
		'
		exit

	elif [ ${ARG} = "init_envfiles" ]
	then
		echo "---init start ${ARG}...--------"
		init_envfiles
		echo '
		################
		# ENV Init OK  #
		################
		'
		exit

	elif [ ${ARG} = "init_docfiles" ]
	then
		echo "---init start ${ARG}...--------"
		init_docfiles
		echo '
		################
		# DOC Init OK  #
		################
		'
		exit

	elif [ ${ARG} = "all" ]
	then
		echo '
		################
		# Start Init   #
		################
		'
		init_ssh
		echo "please go to github and bitbucket,and paste key"
		echo "after paste key, please push enter"
		read
		format_dics
		init_devfiles
		init_docfiles
		init_envfiles
		echo '
		################
		# Init OK      #
		################
		'
		exit

	else
		echo "unrecognize option"
	fi
done

# Todo: run automatically by using curl.
#format_dics
#init_devfiles
#init_envfiles
