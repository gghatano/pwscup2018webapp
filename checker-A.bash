## checker-F.bash

## USAGE: bash checker-F.bash fullpath/to/T fullpath/to/A 

## fullpath
pathToT=$1
pathToA=$2

if [ "$pathToA" = "" ]; then 
	echo "ファイルをアップロードしてください" > /home/rstudio/pwscup2018webapp/res.txt
	exit 0
fi

if [ "$pathToT" = "" ]; then 
	echo "ファイルをアップロードしてください" > /home/rstudio/pwscup2018webapp/res.txt
	exit 0
fi

## Execute
rm /home/rstudio/pwscup2018webapp/res.txt
cd ./pwscup2018sample/pwscup2018sample/checker
java -jar ./checker.jar $pathToT $pathToA &> /home/rstudio/pwscup2018webapp/res.txt

