## checker-F.bash

## USAGE: bash checker-F.bash fullpath/to/T fullpath/to/A fullpath/to/F

## fullpath
pathToT=$1
pathToA=$2
pathToF=$3

if [ "$pathToA" = "" ]; then 
	echo "ファイルをアップロードしてください" > /home/rstudio/pwscup2018webapp/res.txt
	exit 0
fi

if [ "$pathToF" = "" ]; then 
	echo "ファイルをアップロードしてください" > /home/rstudio/pwscup2018webapp/res.txt
	exit 0
fi

## Execute
rm /home/rstudio/pwscup2018webapp/res.txt
cd ./pwscup2018sample/pwscup2018sample/check-f1 
/bin/bash ./check-f1.sh $pathToT $pathToA $pathToF &> /home/rstudio/pwscup2018webapp/res.txt

