#!/usr/bin/perl
use DBI;
use DBD::mysql;
use File::Copy;
use File::Path;
use File::Basename;
use Spreadsheet::WriteExcel;
use Data::Dumper;
use DateTime;

my $exists;
my $Book;
my $excel;
my $XLSelement;
my $XLSarray;

  my $epoch = DateTime->new(
      year      => 1900,
      month     => 1,
      day       => 1,
      hour      => 0,
      minute    => 0,
      time_zone => 'UTC',
  );



my $dbh = DBI->connect( "DBI:mysql:dbname=galileo:localhost", "pma", "Spinoza123", { RaiseError => 1, PrintError => 0, AutoCommit => 0 } )
    or die("Error:$DBI::errstr");
my $excel_file = "/home/keith/Reporting/public/reports/recharge/recharge_report_vha.xls";
my $workbook  = Spreadsheet::WriteExcel->new($excel_file);
    my %font    = (
                    font  => 'Arial',
                    size  => 10,
                    color => 'black',
                    bold  => 1,
                  );

    my %shading = (
                    bg_color => 'yellow',
                    pattern  => 1,
                  );

    my %spacing = (
                    text_wrap => 0,
                   );


my $format = $workbook->add_format(%font, %shading, %spacing);
my $date_format = $workbook->add_format(num_format => 'dd/mm/yy');



my $query = qq{
select * from (
SELECT v_weekly_schedule_report.`JV Site ID`,
       v_weekly_schedule_report.State,
       v_weekly_schedule_report.Area,
       v_weekly_schedule_report.`Build Responsibility`,
       v_weekly_schedule_report.`Vodafone Site ID`,
       v_weekly_schedule_report.`Macro, IBC or Repeater`,
       "S01" as Milestone,
       v_weekly_schedule_report.S1_Planned,
       v_weekly_schedule_report.S1_Forecast,
       v_weekly_schedule_report.S1_Actual
  FROM galileo.v_weekly_schedule_report v_weekly_schedule_report
where (v_weekly_schedule_report.original_node = TRUE)
union
SELECT v_weekly_schedule_report.`JV Site ID`,
       v_weekly_schedule_report.State,
       v_weekly_schedule_report.Area,
       v_weekly_schedule_report.`Build Responsibility`,
       v_weekly_schedule_report.`Vodafone Site ID`,
       v_weekly_schedule_report.`Macro, IBC or Repeater`,
       "S02" as Milestone,
       v_weekly_schedule_report.S2_Planned,
       v_weekly_schedule_report.S2_Forecast,
       v_weekly_schedule_report.S2_Actual
  FROM galileo.v_weekly_schedule_report v_weekly_schedule_report
where (v_weekly_schedule_report.original_node = TRUE)
union
SELECT v_weekly_schedule_report.`JV Site ID`,
       v_weekly_schedule_report.State,
       v_weekly_schedule_report.Area,
       v_weekly_schedule_report.`Build Responsibility`,
       v_weekly_schedule_report.`Vodafone Site ID`,
       v_weekly_schedule_report.`Macro, IBC or Repeater`,
       "S03" as Milestone,
       v_weekly_schedule_report.S3_Planned,
       v_weekly_schedule_report.S3_Forecast,
       v_weekly_schedule_report.S3_Actual
  FROM galileo.v_weekly_schedule_report v_weekly_schedule_report
where (v_weekly_schedule_report.original_node = TRUE)
union
SELECT v_weekly_schedule_report.`JV Site ID`,
       v_weekly_schedule_report.State,
       v_weekly_schedule_report.Area,
       v_weekly_schedule_report.`Build Responsibility`,
       v_weekly_schedule_report.`Vodafone Site ID`,
       v_weekly_schedule_report.`Macro, IBC or Repeater`,
       "S04" as Milestone,
       v_weekly_schedule_report.S4_Planned,
       v_weekly_schedule_report.S4_Forecast,
       v_weekly_schedule_report.S4_Actual
  FROM galileo.v_weekly_schedule_report v_weekly_schedule_report
where (v_weekly_schedule_report.original_node = TRUE)
union
SELECT v_weekly_schedule_report.`JV Site ID`,
       v_weekly_schedule_report.State,
       v_weekly_schedule_report.Area,
       v_weekly_schedule_report.`Build Responsibility`,
       v_weekly_schedule_report.`Vodafone Site ID`,
       v_weekly_schedule_report.`Macro, IBC or Repeater`,
       "S05" as Milestone,
       v_weekly_schedule_report.S5_Planned,
       v_weekly_schedule_report.S5_Forecast,
       v_weekly_schedule_report.S2_Actual
  FROM galileo.v_weekly_schedule_report v_weekly_schedule_report
where (v_weekly_schedule_report.original_node = TRUE)
union
SELECT v_weekly_schedule_report.`JV Site ID`,
       v_weekly_schedule_report.State,
       v_weekly_schedule_report.Area,
       v_weekly_schedule_report.`Build Responsibility`,
       v_weekly_schedule_report.`Vodafone Site ID`,
       v_weekly_schedule_report.`Macro, IBC or Repeater`,
       "S07" as Milestone,
       v_weekly_schedule_report.S7_Planned,
       v_weekly_schedule_report.S7_Forecast,
       v_weekly_schedule_report.S7_Actual
  FROM galileo.v_weekly_schedule_report v_weekly_schedule_report
where (v_weekly_schedule_report.original_node = TRUE)
) as vha_temp
where `Macro, IBC or Repeater` like '%Spinoza'
and `Macro, IBC or Repeater` not like '%CoW%'
order by `JV Site ID`, Milestone
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();
my $worksheet = $workbook->addworksheet("Recharge");
my $row = 3;
$worksheet->write(0,0, "Date Created", $format);
$worksheet->write(1,0, DateTime->now( time_zone => 'Australia/Sydney' ), $format);
$worksheet->write(2,0, "Sites included Macro - Spinoza, IBC - Spinoza, Rptr - Spinoza", $format);


my @fields = $sth->{NAME};
my $col = 0;
foreach my $field (@fields) {
            $worksheet->write($row, $col, $field, $format);
            $col++;
}
$row++;

while (my (@XLSarray) = $sth->fetchrow_array())
{
# Do some conversion stuff...
        my $col = 0;
        foreach my $XLSelement (@XLSarray) {
            if($XLSelement =~ m!^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$!) {
                my ($year,$month,$day) = split (/-/,$XLSelement);
                my $dt = DateTime->new( year => $year, month => $month, day => $day);
                my $diff = $epoch - $dt;
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
}

$sth->finish();

$dbh->disconnect();

$workbook->close();