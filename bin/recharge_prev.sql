select * from t_recharge_report_previous
INTO OUTFILE '/tmp/t2.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
