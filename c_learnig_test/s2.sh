#function chinaisp()
#{
rm -rf CTC.txt
rm -rf OTHER.txt
while read line
do
ISPNM=`whois -h whois.apnic.net $line |grep netname:|awk '{print $2}'`
  if [[ $ISPNM =~ CHINANET* ]];then
     echo "$line|$ISPNM" >>CTC.txt
  fi
   
   #case $ISPNM in
   #     CHINANET*)
   #     echo "$line|$ISPNM" >>CTC.txt
   #     ;;
   #     UNICOM*)
   #     echo "$line|$ISPNM"  >>CNC.txt
   #     ;;
   #     *)
   #     echo "$line|$ISPNM" >>OTHER.txt
   #     ;;
done< $1
#}

#China routing table
#grep "CN|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/cnip.txt
#compute_mask $DIR/cnip.txt >>cnip.txt
#Hong Kong routing table
#grep "HK|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/hkip.txt
#compute_mask $DIR/hkip.txt >>hkip.txt
#Australia's routing table
#grep "AU|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/auip.txt
#compute_mask $DIR/auip.txt >>auip.txt
#South Korea's routing table
#grep "KR|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/krip.txt
#compute_mask $DIR/krip.txt >>krip.txt
#Tai Wan routing table
#grep "TW|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/twip.txt
#compute_mask $DIR/twip.txt >>twip.txt
#Singapore routing table
#grep "SG|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/sgip.txt
#compute_mask $DIR/sgip.txt >>sgip.txt
#Japan's routing table
#grep "JP|ipv4" /home/apnic.txt |awk -F "|" '{print $4"|"$5}' >$DIR/jpip.txt
#compute_mask $DIR/jpip.txt >>jpip.txt
#guone ISP routing table
#chinaisp 
