#!/bin/bash

dir=$(dirname $0)
cd $dir
bash clean.sh

##
python3 defense.py
python3 publish.py
python3 offense.py
python3 utility.py
python3 security.py

##
echo '[Utility]' > result.txt
head data/out/utility/* >> result.txt
echo '' >> result.txt
echo '[Security]' >> result.txt
mv result.txt data/

##
find $dir | grep \\.pyc$ | xargs rm -f
find $dir | grep __pycache__$ | xargs rm -rf
