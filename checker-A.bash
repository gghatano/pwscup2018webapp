## checker-A.bash

## USAGE: bash checker-A.bash fullpath/to/T fullpath/to/A

## fullpath
pathToT=$1
pathToA=$2

( cd ./pwscup2018sample/checker/; java -jar ./checker.jar $pathToT $pathToA )

