#!/bin/bash

for file in images/*.jpg
do
    #convert -size 20%x20% $file ${file%jpg}png
    convert -resize 20%x $file ${file%jpg}png
    echo \<a href="$file"\>\<img src=\"${file%jpg}png\" alt=\"${file/images\//}\" hspece=2\>\</a\>
done