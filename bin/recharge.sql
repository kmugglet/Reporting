select * from t_recharge_report
INTO OUTFILE '/tmp/t1.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';