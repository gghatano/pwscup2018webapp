## checker-F.bash

## USAGE: bash checker-F.bash fullpath/to/T fullpath/to/A fullpath/to/F

## fullpath
pathToT=$1
pathToA=$2
pathToF=$3

( cd ./pwscup2018sample/check-f1/; bash ./check-f1.sh $pathToT $pathToA $pathToF )

