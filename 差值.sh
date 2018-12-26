#!/bin/bash

count1=`cat $1 | wc -l`
count2=`cat $2 | wc -l`

if [[ $count1 -ne $count2 ]];then
	"行号不同，请检查！"
	exit
fi

awk '{print $NF}' $1 > 1.txt
awk '{print $NF}' $2 > 2.txt
cat /dev/null > $3
for((i=1;i<=$count1;i++))
do
	num1=`sed -n "${i}p" 1.txt`
	num2=`sed -n "${i}p" 2.txt`
	#echo "num1=$num1"
	#echo "num2=$num2"
	#num3=`expr $num1 - $num2`
	num3=`echo "scale=5;$num1-$num2"| bc`
	echo "$num3" >> $3  
done

#$1及$2行号相同，且只有score值
#将差值重定向到$3中；
