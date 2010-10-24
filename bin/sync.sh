#!/bin/sh

PATH=/usr/bin
source_dir=/Users/orion/www.observatorymusic.com/htdocs/
dest_dir=~/
dest_host=observatorymusic.com
dest_user=orionletizi

ARG=$1

if [ $# != 1 ]; then
echo -e "Useage: sync.sh test, tmp, or prod\n"
exit
fi

if [ $ARG = test ]; then
        rsync  -xva --dry-run --exclude .svn -e ssh --delete ${source_dir} ${dest_user}@${dest_host}:${dest_dir}
elif [ $ARG = tmp ]; then
        cmd="rsync  -xva --exclude .svn -e ssh --delete ${dest_host}:${dest_dir} /tmp/www.observatorymusic.com/"
	echo "Executing $cmd..."
	$cmd
elif [ $ARG = prod ]; then
        rsync  -xva --exclude .svn -e ssh --delete ${source_dir} ${dest_user}@${dest_host}:${dest_dir}
else
        echo "Useage: sync.sh test, tmp, or stage"
fi