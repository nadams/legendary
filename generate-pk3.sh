#!/bin/sh

FILES=$(ls | grep -vE '.pk3|.sh')

if [ -f legendary.pk3 ]; then
	rm -rf legendary.pk3
fi

zip -r9 legendary.pk3 $FILES -x *.backup* *.dbs *.bak *.db

