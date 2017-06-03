#!/bin/bash
while true
do
sleep 1
num=`ps -ef |grep tcpping |grep -v grep |wc -l`
if [ "$num" -eq 0 ];then
echo "tcpping is not running now!" 
else
echo "tcpping is running" 
fi
done

