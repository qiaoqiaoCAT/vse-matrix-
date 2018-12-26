#!/bin/bash

a=0
b=0
c=0
d=0
e=0
f=0
g=0
j=0

list=()
index=0
for((i=1;i<=1277;i++))
do
	num=`sed -n  "${i}p" $1`
	if [ $(echo "$num < -0.01" | bc) -eq 1 ];then	
		 a=`expr ${a} + 1`
	elif [ $(echo "$num < -0.001" | bc) -eq 1 ];then	
		 b=`expr ${b} + 1`
	elif [ $(echo "$num < -0.0001" | bc) -eq 1 ];then	
		 c=`expr ${c} + 1`
	elif [ $(echo "$num < 0" | bc) -eq 1 ];then	
		 d=`expr ${d} + 1`
	elif [ $(echo "$num < 0.0001" | bc) -eq 1 ];then	
		 e=`expr ${e} + 1`
	elif [ $(echo "$num < 0.001" | bc) -eq 1 ];then	
		 f=`expr ${f} + 1`
	elif [ $(echo "$num < 0.01" | bc) -eq 1 ];then	
		 g=`expr ${g} + 1`
	elif [ $(echo "$num < 0.1" | bc) -eq 1 ];then	
		 j=`expr ${j} + 1`
	
	fi
done
	echo "$1:result"
	echo "{~ -0.01}  	    $a"
	echo "{-0.01 ~ -0.001}	    $b"
	echo "{-0.001 ~ -0.0001}    $c"
	echo "{-0.0001 ~ 0}         $d"
	echo "{0 ~ 0.0001}          $e"
	echo "{0.0001 ~ 0.001}      $f"
	echo "{0.001 ~ 0.01}        $g"
	echo "{0.01 ~0.1}           $j"

	list[0]=$a
	list[1]=$b
	list[2]=$c
	list[3]=$d
	list[4]=$e
	list[5]=$f
	list[6]=$g
	list[7]=$j	
	echo ${list[*]}	
	echo "-------------------------------------------------"
