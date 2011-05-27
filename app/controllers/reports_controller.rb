class ReportsController < ApplicationController
  before_filter :authorize

  def index
    Dir::chdir('/home/keith/Reporting/public/reports/msl')
    @msl_files = Dir::glob('msl_*.xls').sort.reverse
    Dir::chdir('/home/keith/Reporting/public/reports/recharge')
    @recharge_files = Dir::glob('recharge_report_*.xls').sort.reverse
    Dir::chdir('/home/keith/Reporting/public/reports/finance')
    @transmission_files = Dir::glob('monthly_capacity_*.xls').sort.reverse
    Dir::chdir('/home/keith/Reporting/public/reports/spins')
    @spin_files = Dir::glob('spin_report_*.xls').sort.reverse
  end

  def chart
    #debugger
=begin
    @planned = VLatestMilestoneDate.all(:conditions => ["pfa = 'planned' and milestone_id = 6 and milestone_date < ?", Date.today])
    @planned = @planned.count

    @forecast = VLatestMilestoneDate.all(:conditions => ["pfa = 'forecast' and milestone_id = 6  and milestone_date < ?", Date.today])
    @forecast = @forecast.count
    @actual = VLatestMilestoneDate.all(:conditions => ["pfa = 'actual'  and milestone_id = 6 and milestone_date < ?", Date.today])
    @actual =  @actual.count
=end

    @data = Spin.find_by_sql("select year(Check_Date) as yy, month(Check_Date) as mm, day(Check_Date) as dd,sum(Planned) as planned, sum(Forecast) as forecast, sum(Actual) as actual
      from
      (select a.Check_Date,
      if(v.pfa = 'Planned' and v.milestone_date >= a.Check_Date and v.milestone_id = 7,1,0) as Planned,
      if(v.pfa = 'Forecast' and v.milestone_date >= a.Check_Date and v.milestone_id = 7,1,0) as Forecast,
      if(v.pfa = 'Actual' and v.milestone_date >= a.Check_Date and v.milestone_id = 7,1,0) as Actual
      from latest_milestone_dates v, all_dates a
      ) as tmp_table
      group by year(Check_Date), month(Check_Date), day(Check_Date)")
  end
end

