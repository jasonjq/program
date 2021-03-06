#!/bin/bash
Date=`date +%Y%m%d%H%M`
FILE=/home/apnic.txt
mkdir /home/ip$Date
DIR="/home/ip$Date"
rm -f $FILE
wget http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest -O $FILE
wget http://ftp.arin.net/pub/stats/arin/delegated-arin-extended-20170302 -O /home/arin/arin.txt
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
grep "CN|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/cnip.txt
compute_mask $DIR/cnip.txt >>cnip.txt
#Hong Kong routing table
grep "HK|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/hkip.txt
compute_mask $DIR/hkip.txt >>hkip.txt
#Australia's routing table
grep "AU|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/auip.txt
compute_mask $DIR/auip.txt >>auip.txt
#South Korea's routing table
grep "KR|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/krip.txt
compute_mask $DIR/krip.txt >>krip.txt
#Tai Wan routing table
grep "TW|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/twip.txt
compute_mask $DIR/twip.txt >>twip.txt
#Singapore routing table
grep "SG|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/sgip.txt
compute_mask $DIR/sgip.txt >>sgip.txt
#Japan's routing table
grep "JP|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/jpip.txt
compute_mask $DIR/jpip.txt >>jpip.txt

