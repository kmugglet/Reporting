select * from t_msl_sites_previous
INTO OUTFILE '/tmp/t2.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
