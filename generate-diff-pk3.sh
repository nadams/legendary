#!/bin/sh

if [ -z $1 ]; then
	echo "Remote branch name required"
	exit 1
fi

SOURCE_BRANCH=$(git rev-parse --abbrev-ref HEAD)
REMOTE_BRANCH=$1

DIFF_FILES=$(git diff --name-only $SOURCE_BRANCH..$REMOTE_BRANCH)
DEST="diff"
mkdir -p $DEST
cp -Rv $DIFF_FILES $DEST
cd $DEST

if [ -f legendary-diff-$CURRENT_REVISION.pk3 ]; then
	rm -rf legendary-diff-$CURRENT_REVISION.pk3
fi

FILES=$(ls | grep -vE '.pk3|.sh')
CURRENT_REVISION=$(git log --pretty=format:'%h' -n 1)

zip -9r legendary-diff-$CURRENT_REVISION.pk3 $FILES -x *.backup* *.dbs *.bak *.db

cd ..