#!/bin/sh

cd maps

MAPS=$(ls *.wad)
ZDBSP="/c/bin/zdbsp.exe"
OUTDIR="compressed"

if [ -d $OUTDIR ];
then
	rm -rf $OUTDIR
fi

mkdir $OUTDIR

for MAP in $MAPS
do
	$ZDBSP \
		--empty-blockmap \
		--zero-reject \
		--extended \
		--compress \
		--output=$OUTDIR/$MAP \
	$MAP
done

echo "Don't forget to move the compressed maps from the compressed directory into the maps directory."
