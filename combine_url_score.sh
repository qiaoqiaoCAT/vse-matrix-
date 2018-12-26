#!/bin/bash

cat /dev/null > combine.txt
for((i=1;i<=1269;i++))
do
	line=`sed -n "${i}p"  $1`
	url=`echo $line | awk '{print $1}'`
#	echo $url
	score=`sed -n "${i}p" $2`
#	echo $score
	echo "$url $score">>combine.txt
done
