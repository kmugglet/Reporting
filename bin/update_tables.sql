drop table if exists t_msl_sites;
create table t_msl_sites as select * from v_msl_sites;
ALTER TABLE galileo.t_msl_sites
  ADD INDEX t_msl_sites_idx (`JV Site ID`, `Optus Site ID`, `Vodafone Site ID`);
drop table if exists t_msl_nodes;
create table t_msl_nodes as select * from v_msl_nodes;
ALTER TABLE galileo.t_msl_nodes
  ADD INDEX t_msl_nodes_idx (`JV Site ID`, `Node Number`, `WBTS ID`, `RNC ID`);
drop table if exists t_msl_cells;
create table t_msl_cells as select * from v_msl_cells;
ALTER TABLE galileo.t_msl_cells
  ADD INDEX  `t_msl_cells_idx` (`JV Site ID`,`JV Cell ID`,`Cell ID`,`Cell Number`,`UARFCN`);
drop table if exists t_msl_deleted_sites;
create table t_msl_deleted_sites as select * from v_msl_deleted_sites;
drop table if exists t_monthly_capacity_report;
create table t_monthly_capacity_report as select * from v_monthly_capacity_report;
ALTER TABLE galileo.t_monthly_capacity_report
  ADD INDEX t_monthly_idx (`Request ID`, `Work Type`, Technology, Service_commencement_date);
drop table if exists t_recharge_report;
create table t_recharge_report as select * from v_recharge_report;
ALTER TABLE galileo.t_recharge_report
  ADD INDEX t_recharge_idx (`JV Site ID`, `Node Number`, `RNC ID`, `WBTS ID`, State, Area, wa_id);
