#!/bin/bash
clear
sudo apt install mp3info
IFS=$'\n'
output="output.csv"
touch $output
rm $output
exec 2>errors.txt

#making a header of *.csv
echo "name,type,size,rights,date,duration" >>$output
#start collecting info about file
i=0
for line in `ls -l`
do
 if [ $i -eq 0 ] 
 then 
i=$(( $i + 1 ))
 continue
 fi
 fil=`echo $line | awk '{print $9}'`

 name=`echo "$fil" | awk -F '.' '{print $1}' ` #name is everything before dot
 echo -n "$name," #print without new line
 #say its directory or print type of file
 if [ -d "$fil" ]
 then 
  echo -n "directory,"
 elif [ -f "$fil" ] 
 then 
   mtype=`echo "$fil" | awk -F '.' '{print $2}' `  #type is everything after dot
   echo -n "$mtype," #print without new line
 fi

 #print size of item
msize=`echo $line | awk '{print $5}'`
 echo -n "$msize,"

 #print rights
 #echo -n "`stat -c %A $fil`,"
  mrights=`echo $line | awk '{print $1}'`
 echo -n "$mrights,"

 #print date
 mdate=`echo $line | awk '{print $7 $6  $8}'`
 echo -n "$mdate,"
 if [ $mtype != "mp3" ] 
   then echo -n ","
 else echo -n "`mp3info -p "%m:%s" $fil`"
 fi
 #start new line 
 echo ""
done >>$output
echo "enjoy your life"
#cat $output
