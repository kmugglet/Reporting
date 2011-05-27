select * from t_msl_sites
INTO OUTFILE '/tmp/t1.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';