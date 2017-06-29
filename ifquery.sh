#!/bin/bash
nic=(`ifquery -l |grep -v lo`)
tb=(`seq 2 5`)

for ((i=0,j=0;i<${#nic[@]},j<${#nic[@]};i++,j++))
    do
      ifquery ${nic[i]}|grep address |awk -v tbb="${tb[j]}" '{print "ip rule add from "$2"/32 table "tbb""}'
      ifquery ${nic[i]}|grep gateway |awk -v tbb="${tb[j]}" '{print "ip route add default via "$2" table "tbb""}'
    done
