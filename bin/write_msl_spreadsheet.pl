#!/usr/bin/perl
use DBI;
use DBD::mysql;
use File::Copy;
use File::Path;
use File::Basename;
use Spreadsheet::WriteExcel;
use Data::Dumper;
use DateTime;

  my $epoch = DateTime->new(
      year      => 1900,
      month     => 1,
      day       => 1,
      hour      => 0,
      minute    => 0,
      time_zone => 'UTC',
  );

my $exists;
my $Book;
my $excel;

my $dbh = DBI->connect( "DBI:mysql:dbname=galileo:localhost", "pma", "Spinoza123", { RaiseError => 1, PrintError => 0, AutoCommit => 0 } )
    or die("Error:$DBI::errstr");
my $excel_file = "/home/keith/Reporting/public/reports/msl/msl.xls";
my $workbook  = Spreadsheet::WriteExcel->new($excel_file);
    my %font    = (
                    font  => 'Arial',
                    size  => 10,
                    color => 'white',
                    bold  => 1,
                  );

    my %shading = (
                    bg_color => 'green',
                    pattern  => 1,
                  );

    my %spacing = (
                    text_wrap => 0,
                   );


my $format = $workbook->add_format(%font, %shading, %spacing);
my $date_format = $workbook->add_format(num_format => 'dd/mm/yy');

my $query = qq{SELECT * FROM t_msl_sites};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();
my $worksheet = $workbook->addworksheet("Sites");
my $row = 3;
$worksheet->write(0,0, "Date Created", $format);
$worksheet->write(1,0, DateTime->now( time_zone => 'Australia/Sydney' ), $format);
$worksheet->write(2,0, "Sites", $format);


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

$query = qq{SELECT * FROM t_msl_nodes};
#print "$query\n";

# Build a query...
$sth = $dbh->prepare($query);
$sth->execute();

$worksheet = $workbook->addworksheet("Nodes");
$worksheet->write(2,0, "Nodes", $format);

$row = 3;
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

$query = qq{SELECT * FROM t_msl_cells};
#print "$query\n";

# Build a query...
$sth = $dbh->prepare($query);
$sth->execute();

$worksheet = $workbook->addworksheet("Cells");
$worksheet->write(2,0, "Cells", $format);

$row = 3;
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

$query = qq{SELECT * FROM t_msl_deleted_sites};
#print "$query\n";

# Build a query...
$sth = $dbh->prepare($query);
$sth->execute();

$worksheet = $workbook->addworksheet("Deleted Sites");
$worksheet->write(2,0, "Deleted Sites", $format);

$row = 3;
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
            $worksheet->write($row, $col, $XLSelement);
            $col++;
        }
        $row++;
}
$sth->finish();

$dbh->disconnect();

#$worksheet->close();
$workbook->close();