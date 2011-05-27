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
my $excel_file = "/home/keith/Reporting/public/reports/spins/spin_report.xls";
my $workbook  = Spreadsheet::WriteExcel->new($excel_file);
    my %font    = (
                    font  => 'Arial',
                    size  => 10,
                    color => 'black',
                    bold  => 1,
                  );

    my %shading = (
                    bg_color => 'orange',
                    pattern  => 1,
                  );

    my %spacing = (
                    text_wrap => 0,
                   );


my $format = $workbook->add_format(%font, %shading, %spacing);
my $date_format = $workbook->add_format(num_format => 'dd/mm/yy');
my $bold_format = $workbook->add_format(%font);

my $query = qq{SELECT * FROM v_spin_report where date_closed is null};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();
my $worksheet = $workbook->addworksheet("Open Spins");
my $row = 3;
$worksheet->write(0,0, "Date Created", $format);
$worksheet->write(1,0, DateTime->now( time_zone => 'Australia/Sydney' ), $format);
$worksheet->write(2,0, "Open Spins", $format);


my @fields = $sth->{NAME};
my $col = 0;
foreach my $field (@fields) {
            $worksheet->write($row, $col, $field, $format);
            $col++;
}
$row++;

while (my (@XLSarray) = $sth->fetchrow_array())
{
        my $col = 0;
        foreach my $XLSelement (@XLSarray) {
            if($XLSelement =~ m!^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$!) {
                my ($year,$month,$day) = split (/-/,$XLSelement);
                my $dt = DateTime->new( year => $year, month => $month, day => $day);
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
};
$sth->finish();

$dbh->disconnect();

my $dbh = DBI->connect( "DBI:mysql:dbname=galileo:localhost", "pma", "Spinoza123", { RaiseError => 1, PrintError => 0, AutoCommit => 0 } )
    or die("Error:$DBI::errstr");

my $query = qq{SELECT * FROM v_spin_report};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();
my $worksheet = $workbook->addworksheet("All Spins");
my $row = 3;
$worksheet->write(2,0, "All Spins", $format);


my @fields = $sth->{NAME};
my $col = 0;
foreach my $field (@fields) {
            $worksheet->write($row, $col, $field, $format);
            $col++;
}
$row++;

while (my (@XLSarray) = $sth->fetchrow_array())
{
        my $col = 0;
        foreach my $XLSelement (@XLSarray) {
            if($XLSelement =~ m!^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$!) {
                my ($year,$month,$day) = split (/-/,$XLSelement);
                my $dt = DateTime->new( year => $year, month => $month, day => $day);
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
};
$sth->finish();

$dbh->disconnect();

my $dbh = DBI->connect( "DBI:mysql:dbname=galileo:localhost", "pma", "Spinoza123", { RaiseError => 1, PrintError => 0, AutoCommit => 0 } )
    or die("Error:$DBI::errstr");

my $query = qq{SELECT * FROM v_spin_summary_open};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();
my $worksheet = $workbook->addworksheet("Summary");
my $row = 3;
$worksheet->write(2,0, "Open Summary", $bold_format);


my @fields = $sth->{NAME};
my $col = 0;
foreach my $field (@fields) {
            $worksheet->write($row, $col, $field, $bold_format);
            $col++;
}
$row++;

while (my (@XLSarray) = $sth->fetchrow_array())
{
        my $col = 0;
        foreach my $XLSelement (@XLSarray) {
            if($XLSelement =~ m!^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$!) {
                my ($year,$month,$day) = split (/-/,$XLSelement);
                my $dt = DateTime->new( year => $year, month => $month, day => $day);
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
};
$sth->finish();

#my $query = qq{SELECT * FROM v_spin_sla_summary};
##print "$query\n";
#
## Build a query...
#my $sth = $dbh->prepare($query);
#$sth->execute();
#
#$row++;
#$row++;
#$row++;
#
#$worksheet->write($row,0, "SLA Summary (Spins breaching intervals defined below)", $bold_format);
#$row++;
#$worksheet->write($row,0, "60 days", $bold_format);
#$worksheet->write($row,1, "10 days", $bold_format);
#$worksheet->write($row,2, "3 days", $bold_format);
#$worksheet->write($row,3, "4 days", $bold_format);
#$row++;
#
#my @fields = $sth->{NAME};
#my $col = 0;
#foreach my $field (@fields) {
#            $worksheet->write($row, $col, $field, $bold_format);
#            $col++;
#}
#$row++;
#
#while (my (@XLSarray) = $sth->fetchrow_array())
#{
#        my $col = 0;
#        foreach my $XLSelement (@XLSarray) {
#            if($XLSelement =~ m!^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$!) {
#                my ($year,$month,$day) = split (/-/,$XLSelement);
#                my $dt = DateTime->new( year => $year, month => $month, day => $day);
#                my $diff = $epoch - $dt;
#                $worksheet->write_date_time($row, $col, $dt, $date_format);
#            } else {
#            $worksheet->write($row, $col, $XLSelement);
#            };
#            $col++;
#        }
#        $row++;
#};
#$sth->finish();

$dbh->disconnect();

$workbook->close();

