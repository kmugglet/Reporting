drop table if exists latest_milestone_dates;
create table latest_milestone_dates as select * from v_latest_milestone_dates;
ALTER TABLE `latest_milestone_dates`
ADD INDEX `node_pfa_milestone_idx` (`node_id` ASC, `pfa` ASC, `milestone_id` ASC) ;
