## checker-F.bash

## USAGE: bash checker-F.bash fullpath/to/T fullpath/to/A fullpath/to/F

## fullpath
pathToT=$1
pathToA=$2
pathToF=$3

if [ "$pathToA" = "" ]; then 
	echo "ファイルをアップロードしてください" > /srv/shiny-server/pwscup2018webapp/res.txt
	exit 0
fi

if [ "$pathToF" = "" ]; then 
	echo "ファイルをアップロードしてください" > /srv/shiny-server/pwscup2018webapp/res.txt
	exit 0
fi

## Execute
rm /srv/shiny-server/pwscup2018webapp/res.txt
cd ./pwscup2018sample/check-f1 
/bin/bash ./check-f1.sh $pathToT $pathToA $pathToF &> /srv/shiny-server/pwscup2018webapp/res.txt

