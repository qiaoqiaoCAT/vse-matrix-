#!/bin/bash

cat /dev/null > $3
for((i=1;i<=1269;i++))
do
	num1=`sed -n "${i}p" $1`
	num2=`sed -n "${i}p" $2`
	#echo "num1=$num1"
	#echo "num2=$num2"
	#num3=`expr $num1 - $num2`
	num3=`echo "scale=8;$num1-$num2"| bc`
	echo "$num3" >> $3  
done
