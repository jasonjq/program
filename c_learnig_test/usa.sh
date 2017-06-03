#!/bin/bash
Date=`date +%Y%m%d%H%M`
mkdir /home/ip$Date
DIR="/home/ip$Date"
wget http://ftp.arin.net/pub/stats/arin/delegated-arin-extended-20170302 -O /home/arin.txt
function compute_mask()
{
local array_ip=($(awk -F "|" '{print $1}' $1))
local array_mask=($(awk -F "|" '{print $2}' $1))
for ((i=0,j=0;i<${#array_ip[@]},j<${#array_mask[@]};i++,j++));
  do
    ev_ip=${array_ip[$i]}
    ev_mask=${array_mask[j]}
      for ((a=1;a<=32;a++));
        do
          if [ `echo $[2**$a]` -eq $ev_mask ];then
            ar_mask=`expr 32 - $a`
            echo "$ev_ip/$ar_mask"
          fi
        done
  done
}

#China routing table
grep "US|ipv4" /home/arin.txt|awk -F "|" '{print $4"|"$5}' >/home/usa.txt
compute_mask /home/usa.txt >>/home/usa_route_table.txt

