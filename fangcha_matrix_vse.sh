#!/bin/bash
sum=0

while read line
do
       sum=`echo "$sum + $line" | bc`
done<$1

echo "sum=$sum"
count_num=`cat $1 | wc -l`
avg=`echo "scale=8;$sum/$count_num" | bc`
echo "avg=$avg"

f_sum=0
while read score
do
	num1=`echo "$score - $avg" | bc`
	echo "num1=$num1"
	num2=`echo "$num1 * $num1" | bc`
	echo "num2=$num2"
	f_sum=`echo "$f_sum + $num2" | bc`
	echo "f_sum=$f_sum"
done<$1

sum_n=`echo "scale=8;$f_sum/$count_num" | bc`
aim=`echo "scale=8;sqrt($sum_n)" | bc`

echo "aim=$aim"
