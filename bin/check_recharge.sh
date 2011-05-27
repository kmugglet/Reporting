#!/bin/bash
cd /home/keith/Reporting/bin
rm /tmp/t1.csv
rm /tmp/t2.csv
rm /tmp/t3.csv

mysql galileo < /home/keith/Reporting/bin/recharge.sql
mysql galileo < /home/keith/Reporting/bin/recharge_prev.sql
for L in `cat /tmp/t1.csv`
do
T1="0"
grep -s -q -x -e $L /tmp/t2.csv && T1="1"
if [ "$T1" = "0" ]; then
echo "$L","New" >> /tmp/t3.csv
fi
done
