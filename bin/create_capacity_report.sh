#!/bin/bash
cd /home/keith/Reporting/public/reports/finance
export Date=`date +%Y_%m_%d`
mysql galileo << EOF > /home/keith/Reporting/public/reports/finance/finance_distribution_list.txt
select users.email as Email_Distribution from users, user_reports, reports where users.id = user_reports.user_id and user_reports.report_id = reports.id and reports.name = "Monthly Transmission Report" and user_reports.active is true order by users.email;
exit
EOF
cp monthly_capacity.xls monthly_capacity_$Date.xls
mysql galileo << EOF > /home/keith/Reporting/public/reports/finance/finance_distribution_list.txt
select users.email as Email_Distribution from users, user_reports, reports where users.id = user_reports.user_id and user_reports.report_id = reports.id and reports.name = "Monthly Transmission Report" and user_reports.active is true order by users.email;
exit
EOF
zip monthly_capacity_$Date.zip monthly_capacity_$Date.xls
mutt -a monthly_capacity_$Date.zip -s monthly_capacity_$Date.xls -- denis.gleeson.ext@nsn.com  < /home/keith/Reporting/public/reports/finance/finance_distribution_list.txt
mutt -a monthly_capacity_$Date.zip -s monthly_capacity_$Date.xls -- steve.brackenbury@vodafone.com.au < /home/keith/Reporting/public/reports/finance/finance_distribution_list.txt
mutt -a monthly_capacity_$Date.zip -s monthly_capacity_$Date.xls -- keith.muggleton.ext@nsn.com < /home/keith/Reporting/public/reports/finance/finance_distribution_list.txt


