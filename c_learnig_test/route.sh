#!/bin/bash
while read line
do
route add -net $line gw $2
done < $1
