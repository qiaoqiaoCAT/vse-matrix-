#!/bin/bash

#2中有多少文件存在与$1中，计算重合率/$1

num_hang1=`cat $1 | wc -l`
num_hang2=`cat $2 | wc -l`

awk '{print $1}' $2 > 2.txt
awk '{print $1}' $1 > 1.txt

same=1

line2_count=1
line1_count=1

name1=$1"_same.txt"
name2=$2"_same.txt"

cat /dev/null > $name1
cat /dev/null > $name2
cat /dev/null > x.txt

while read line2
do
	url2=$line2
	line1_count=1
	while read line1
	do
		url1=$line1
		if [[ $url1 == $url2 ]];then
			let same++
			#sed -n "${line1_count}p" $1 >> $name1 
			sed -n "${line2_count}p" $2 >> $name2
			sed -n "${line1_count}p" $1 >> $name1 
			#echo "same:$same"
		fi	
		let line1_count++
		echo "line1=$line1_count"
	done<1.txt
	let line2_count++
done<2.txt         

rate=`echo " scale=4;$same/$num_hang1 " | bc` 
echo "相同个数/该阈值下matrix总数=$same/$num_hang1 即:$rate" 

#$1代表matrix中小于0.01的文件 【 带有url】
#$2代表nv中小于0.01的图片   【带url】


#same代表重合个数
#matrix_num代表小于该阈值下matrix总数
#rate代表same/matrix_num
