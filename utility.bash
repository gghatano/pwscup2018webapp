#!/bin/bash

## USAGE:  bash utility.bash full/path/to/T fullpath/to/A


## fullpath
pathToT=$1
pathToA=$2

if [ "$pathToA" = "" ]; then 
	echo "ファイルをアップロードしてください" > /srv/shiny-server/pwscup2018webapp/res.txt
	exit 0
fi

if [ "$pathToT" = "" ]; then 
	echo "ファイルをアップロードしてください" > /srv/shiny-server/pwscup2018webapp/res.txt
	exit 0
fi

## Execute
# rm /srv/shiny-server/pwscup2018webapp/res.txt
cp $2 /srv/shiny-server/pwscup2018webapp/pwscup2018sample/drill/data/A.csv
cd ./pwscup2018sample/drill/
bash ./command.sh
cp /srv/shiny-server/pwscup2018webapp/pwscup2018sample/drill/data/result.txt /srv/shiny-server/pwscup2018webapp/res.txt
