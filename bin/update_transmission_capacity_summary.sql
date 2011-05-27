drop table if exists t_transmission_capacity_summary;
create table t_transmission_capacity_summary as select * from v_transmission_capacity_summary;
