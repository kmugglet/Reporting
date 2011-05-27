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
my $excel_file = "/home/keith/Reporting/public/reports/finance/current_capacity.xls";
my $workbook  = Spreadsheet::WriteExcel->new($excel_file);
    my %font    = (
                    font  => 'Arial',
                    size  => 10,
                    color => 'white',
                    bold  => 1,
                  );

    my %shading = (
                    bg_color => 'blue',
                    pattern  => 1,
                  );

    my %spacing = (
                    text_wrap => 0,
                   );


my $format = $workbook->add_format(%font, %shading, %spacing);
my $date_format = $workbook->add_format(num_format => 'dd/mm/yy');

$dbh = DBI->connect( "DBI:mysql:dbname=galileo:localhost", "pma", "Spinoza123", { RaiseError => 1, PrintError => 0, AutoCommit => 0 } )
    or die("Error:$DBI::errstr");

$query = qq{
select temp.* from
(select `Site ID`,`Site Name`,Area,State, Build_Responsibility,
`Macro Type`,`Node Number`,Active_Node_Owner,Technology,sum(`Capacity Change`) as `Current Capacity`,max(`Transmission Complete (S7)`) as S7,max(Service_commencement_date) as S8
from t_monthly_capacity_report
group by `Site ID`,`Site Name`,Area,State,Technology,Active_Node_Owner, Build_Responsibility,
`Macro Type`,`Node Number`
order by `Site ID`, `Node Number`) as temp
where temp.`Current Capacity` <> 0
};
#print "$query\n";

# Build a query...
$sth = $dbh->prepare($query);
$sth->execute();
$worksheet = $workbook->addworksheet("Current Transmission Capacity");
$row = 3;
$worksheet->write(0,0, "Date Created", $format);
$worksheet->write(1,0, DateTime->now( time_zone => 'Australia/Sydney' ), $format);
$worksheet->write(2,0, "Current Transmission Capacity per node", $format);


@fields = $sth->{NAME};
$col = 0;
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

#$worksheet->close();
$workbook->close();