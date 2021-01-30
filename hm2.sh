#!/bin/bash

echo $1 $2 $3

url=$1
thread=$2
destination=$3

if test -e $url 
then
echo "file exists"
else
exit 1 
fi

if test -d $destination 
then 
echo "folder exists"
else 
mkdir $destination
fi


cat $url | parallel --verbose -P $thread curl -o $destination/{#}-zip_MB.zip {}  

for i in $(ls *zip)

do  

  unzip $i -d $destination/$i-$RANDOM
done
		

