#!/bin/bash
cd /home/keith/Reporting/public/reports/recharge
export Date=`date +%Y_%m_%d`
cp recharge_report.xls recharge_report_$Date.xls
mysql galileo << EOF
drop tables if exists t_recharge_report_previous;
create table t_recharge_report_previous as select * from t_recharge_report;
exit
EOF
mysql galileo << EOF > /home/keith/Reporting/public/reports/recharge/recharge_distribution_list.txt
select users.email as Email_Distribution from users, user_reports, reports where users.id = user_reports.user_id and user_reports.report_id = reports.id and reports.name = "Recharge Report" and user_reports.active is true order by users.email;
exit
EOF
zip recharge_report_$Date.zip recharge_report_$Date.xls
mutt -a recharge_report_$Date.zip -s recharge_report_$Date.xls -- mark.lawton@vodafone.com.au keith.muggleton.ext@nsn.com < /home/keith/Reporting/public/reports/recharge/recharge_distribution_list.txt

