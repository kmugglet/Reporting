#!/bin/bash
cd /home/keith/Reporting/public/reports/msl
export Date=`date +%Y_%m_%d`
cp msl.xls msl_$Date.xls
mysql galileo << EOF
drop tables if exists t_msl_sites_previous;
create table t_msl_sites_previous as select * from t_msl_sites;
exit
EOF
mysql galileo << EOF > /home/keith/Reporting/public/reports/msl/msl_distribution_list.txt
select users.email  as Email_Distribution from users, user_reports, reports where users.id = user_reports.user_id and user_reports.report_id = reports.id and reports.name = "MSL" and user_reports.active is true order by users.email;
exit
EOF
zip msl_$Date.zip msl_$Date.xls
mutt -a msl_$Date.zip -s msl_$Date.xls -- mark.lawton@vodafone.com.au keith.muggleton.ext@nsn.com < /home/keith/Reporting/public/reports/msl/msl_distribution_list.txt



