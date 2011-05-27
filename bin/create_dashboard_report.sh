#!/bin/bash
cd /home/keith/Reporting/public/reports/dashboard
export Date=`date +%Y_%m_%d`
cp dashboard.xls dashboard_$Date.xls
