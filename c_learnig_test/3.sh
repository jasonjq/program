#!/bin/bash
#grep "CN|ipv4" /home/ip_apnic  |awk -F "|" '{print $4"|"$5}' >/tmp/ip.txt
function compute_mask()
{
for i  in `awk -F "|" '{print $1}' $1`
do
    for j in `awk -F "|" '{print $2}' $1`
    do
        for ((a=1;a<=32;a++));
        do
           if [ `echo $[2**$a]` -eq $j ];then
           echo "$i/`expr 32 - $a`"
           fi

        done  
    done
done
}
compute_mask $1
