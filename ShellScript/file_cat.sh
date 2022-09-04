#!/bin/sh

dir_path="/home/toshiya/Work/DeepLearning/keiba/data/SEISEKI/*"
files=`find $dir_path -maxdepth 0 -type f -name '*.CSV'`


for file in $files; do
    #echo $file
    `sed -i -e '1d' $file`
    cat $file >> out2020.csv
done

#for file in $files; do

    #echo $file
    #cat $file >> out2020.csv

#done
