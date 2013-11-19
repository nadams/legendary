#!/bin/sh

FILES=$(ls | grep -vE '.pk3|.sh')
CURRENT_REVISION=$(git log --pretty=format:'%h' -n 1)

if [ -f legendary-$CURRENT_REVISION.pk3 ]; then
	rm -rf legendary-$CURRENT_REVISION.pk3
fi

zip -9r legendary-$CURRENT_REVISION.pk3 $FILES -x *.backup* *.dbs *.bak *.db
