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
my $excel_file = "/home/keith/Reporting/public/reports/recharge/recharge_report.xls";
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
SELECT DISTINCT
 `JV Site ID`,`Site Name`,`State`,
 `Area`,`Optus Site ID`,`Vodafone Site ID`,
 `Pre-Spinoza Site Status`,`E/G`,
 `Macro, IBC or Repeater`,`Build Responsibility`,
 `Source`,`Replacing`,`address`,
 `Node Count`,`Optus Cell Count`,`Vodafone Cell Count`,
 `S1_Planned`,`S1_Forecast`,`S1_Actual`,
 `S2_Planned`,`S2_Forecast`,`S2_Actual`,
 `S3_Planned`,`S3_Forecast`,`S3_Actual`,
 `S4_Planned`,`S4_Forecast`,`S4_Actual`,
 `S5_Planned`,`S5_Forecast`,`S5_Actual`,
 `S6_Planned`,`S6_Forecast`,`S6_Actual`,
 `S7_Planned`,`S7_Forecast`,`S7_Actual`,
 `WA ID`
FROM v_weekly_schedule_report
where `v_weekly_schedule_report`.`Macro, IBC or Repeater` like '%Spinoza%'
and `v_weekly_schedule_report`.`Macro, IBC or Repeater` not like '%CoW%'
and `v_weekly_schedule_report`.`recharge` = 1
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

my $query = qq{SELECT * FROM v_recharge_summary};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();
my $worksheet = $workbook->addworksheet("Summary");
my $row = 3;
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

$row++;
$row++;
$row++;

my $query = qq{SELECT * FROM t_recharge_summary};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();

$worksheet->write($row,0, "Comparison Summary from last report", $format);
$row++;

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