#!/bin/bash
DIR=/data/ip
APNIC=$DIR/apnic
CNNET=$DIR/cnnet
ctc=$DIR/ctc
cucc=$DIR/cucc
cmcc=$DIR/cmcc

rm -f $APNIC
rm -f $CNNET
rm -f $ctc
rm -f $cucc
rm -f $cmcc

wget http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest -O $APNIC
grep '|CN|ipv4|' $APNIC | cut -f 4,5 -d'|'|sed -e 's/|/ /g' | while read ip submask
do
        #echo $ip/$submask
        echo $ip/$submask >> $CNNET
        NETNAME=`whois -h whois.apnic.net $ip | grep -e ^netname -e ^mnt-by -e ^mnt-lower -e ^descr | sed -e 's/.*:      (.*)/1/g' | sed -e 's/-.*//g'`

        if echo $NETNAME | grep -i -e 'CHINANET' -e 'CHINATELECOM'
                then echo $ip/$submask >> $ctc
        elif echo $NETNAME | grep -i -e 'UNICOM' -e 'CNC' -e 'CNCGROUP'
                then echo $ip/$submask >> $cucc
        elif echo $NETNAME | grep -i -e 'CMNET' -e 'CMCC' -e 'MOBILE'
                then echo $ip/$submask >> $cmcc
        fi
done
