#!/bin/bash

#去掉$1及$2中为NULL的行，且使二者向对应（每行的url相同）
i=1
j=0
list=[]
while read line
do
	if [[ $line == 'NULL' ]]
	then
	#	echo "$i"
		list[j]=$i
		j=`expr $j + 1`
	fi
	i=`expr $i + 1`
done<$1

#echo ${list[@]}


for((i=0;i<${#list[*]};i++))
do
		echo "listi:${list[$i]}"
		sed  -i  "${list[i]}c NULL" $2
done

#将此脚本的输入$1及$2颠倒再执行一遍，再将null删除   #sed -i '/NULL/d' dgface.txt
