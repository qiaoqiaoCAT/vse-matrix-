#!/bin/bash

cat /dev/null > $2
count=0
line_sum=`cat $1 | wc -l`
for((i=1;i<=$line_sum;i++))
do
	num1=`sed -n "${i}p" $1`
	#echo $num1 
	num2=`echo $num1 | awk '{print $NF}'`
	#echo $num2
	if [ $(echo "$num2 > $3" | bc) -eq 1 ];then
    		echo "$num1" | awk '{print $1,$NF}' >> $2
    		echo "$num1" | awk '{print $1,$NF}' 
    		count=`expr $count + 1`
        fi
done

#echo "$1总个数:$count" >> $2

# $1:需要查询的原始文件
# $2:将筛选出的结果追加到$2文件中
# $3:阈值 
