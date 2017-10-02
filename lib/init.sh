#!/bin/bash
set -eu
define(){ eval ${1:?}=\"\${*\:2}\"; }
array (){ eval ${1:?}=\(\"\${@\:2}\"\); }

echo "Initializing..."
(sh init_ssh.sh)
(sh init_fs.sh)
(sh init_envmgr.sh)
