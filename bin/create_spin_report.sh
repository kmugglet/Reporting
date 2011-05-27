#!/bin/bash
cd /home/keith/Reporting/public/reports/spins
export Date=`date +%Y_%m_%d`
cp spin_report.xls spin_report_$Date.xls
