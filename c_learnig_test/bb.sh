#!/bin/bash
for i in `cat /home/$1`
do
  num=`grep "$i|ipv4" /home/$2 |wc -l`
  echo "$i--$num"
done
