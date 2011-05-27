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
my $second_col = 5;

my $dbh = DBI->connect( "DBI:mysql:dbname=galileo:localhost", "pma", "Spinoza123", { RaiseError => 1, PrintError => 0, AutoCommit => 0 } )
    or die("Error:$DBI::errstr");
my $excel_file = "/home/keith/Reporting/public/reports/dashboard/dashboard.xls";
my $workbook  = Spreadsheet::WriteExcel->new($excel_file);
    my %font    = (
                    font  => 'Arial',
                    size  => 10,
                    color => 'black',
                    bold  => 1,
                  );

    my %shading = (
                    bg_color => 'silver',
                    pattern  => 1,
                  );

    my %spacing = (
                    text_wrap => 0,
                   );


my $format = $workbook->add_format(%font, %shading, %spacing);
my $date_format = $workbook->add_format(num_format => 'dd/mm/yy');

my $worksheet = $workbook->addworksheet("Config");
my $row = 3;
$worksheet->write(0,0, "Date Created", $format);
$worksheet->write(1,0, DateTime->now( time_zone => 'Australia/Sydney' ), $format);
$worksheet->write(2,0, "Config Report", $format);

for($i =0; $i< 3; $i++)
    {
        for($j =0; $j< 3; $j++)
            {
                $worksheet->write($row,$j, " ");
            }
        $row++;
    }

$row = 6;
$worksheet->write($row,0, "Macro - Spinoza @ RFI", $format);
$row++;

my $query = qq{
SELECT
v_config_report.`Build Responsibility`,
sum(if(v_config_report.Area = 'Inner',v_config_report.Sites,0)) as 'Inner',
sum(if(v_config_report.Area = 'MOR',v_config_report.Sites,0)) as 'MORAN',
sum(1) as 'Total'
FROM
v_config_report
WHERE
v_config_report.`Macro, IBC or Repeater` = 'Macro - Spinoza'
and v_config_report.RFI = 'yes'
GROUP BY
v_config_report.`Build Responsibility`
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


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
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
}

$sth->finish();

$row = 11;
$worksheet->write($row,0, "IBC - Spinoza @ RFI", $format);
$row++;

my $query = qq{
SELECT
v_config_report.`Build Responsibility`,
sum(if(v_config_report.Area = 'Inner',v_config_report.Sites,0)) as 'Inner',
sum(if(v_config_report.Area = 'MOR',v_config_report.Sites,0)) as 'MORAN',
sum(1) as 'Total'
FROM
v_config_report
WHERE
v_config_report.`Macro, IBC or Repeater` = 'IBC - Spinoza'
and v_config_report.RFI = 'yes'
GROUP BY
v_config_report.`Build Responsibility`
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


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
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
}

$sth->finish();

$row = 16;
$worksheet->write($row,0, "Macro - Sole Risk @ RFI", $format);
$row++;

my $query = qq{
SELECT
v_config_report.`Build Responsibility`,
sum(if(v_config_report.Area = 'Inner',v_config_report.Sites,0)) as 'Inner',
sum(if(v_config_report.Area = 'MOR',v_config_report.Sites,0)) as 'MORAN',
sum(1) as 'Total'
FROM
v_config_report
WHERE
(v_config_report.`Macro, IBC or Repeater` = 'Macro - Vodafone'
or v_config_report.`Macro, IBC or Repeater` = 'Macro - Optus')
and v_config_report.RFI = 'yes'
GROUP BY
v_config_report.`Build Responsibility`
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


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
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
}

$sth->finish();


$row = 21;
$worksheet->write($row,0, "IBC - Sole Risk @ RFI", $format);
$row++;

my $query = qq{
SELECT
v_config_report.`Build Responsibility`,
sum(if(v_config_report.Area = 'Inner',v_config_report.Sites,0)) as 'Inner',
sum(if(v_config_report.Area = 'MOR',v_config_report.Sites,0)) as 'MORAN',
sum(1) as 'Total'
FROM
v_config_report
WHERE
(v_config_report.`Macro, IBC or Repeater` = 'IBC - Vodafone'
or v_config_report.`Macro, IBC or Repeater` = 'IBC - Optus')
and v_config_report.RFI = 'yes'
GROUP BY
v_config_report.`Build Responsibility`
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


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

##### Not S8 #############
$row = 3;
for($i =0; $i< 3; $i++)
    {
        for($j =4; $j< 14; $j++)
            {
                $worksheet->write($row,$j, " ");
            }
        $row++;
    }

$row = 6;
$worksheet->write($row,$second_col, "Macro - Spinoza - Not RFI", $format);
$row++;

my $query = qq{
SELECT
v_config_report.`Build Responsibility`,
sum(if(v_config_report.Area = 'Inner',v_config_report.Sites,0)) as 'Inner',
sum(if(v_config_report.Area = 'MOR',v_config_report.Sites,0)) as 'MORAN',
sum(1) as 'Total'
FROM
v_config_report
WHERE
v_config_report.`Macro, IBC or Repeater` = 'Macro - Spinoza'
and v_config_report.RFI = 'no'
GROUP BY
v_config_report.`Build Responsibility`
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


my @fields = $sth->{NAME};
my $col = $second_col;
foreach my $field (@fields) {
            $worksheet->write($row, $col, $field, $format);
            $col++;
}
$row++;

while (my (@XLSarray) = $sth->fetchrow_array())
{
# Do some conversion stuff...
my $col = $second_col;
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
}

$sth->finish();

$row = 11;
$worksheet->write($row,$second_col, "IBC - Spinoza - Not RFI", $format);
$row++;

my $query = qq{
SELECT
v_config_report.`Build Responsibility`,
sum(if(v_config_report.Area = 'Inner',v_config_report.Sites,0)) as 'Inner',
sum(if(v_config_report.Area = 'MOR',v_config_report.Sites,0)) as 'MORAN',
sum(1) as 'Total'
FROM
v_config_report
WHERE
v_config_report.`Macro, IBC or Repeater` = 'IBC - Spinoza'
and v_config_report.RFI = 'no'
GROUP BY
v_config_report.`Build Responsibility`
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


my @fields = $sth->{NAME};
my $col = $second_col;
foreach my $field (@fields) {
            $worksheet->write($row, $col, $field, $format);
            $col++;
}
$row++;

while (my (@XLSarray) = $sth->fetchrow_array())
{
# Do some conversion stuff...
my $col = $second_col;
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
}

$sth->finish();

$row = 16;
$worksheet->write($row,$second_col, "Macro - Sole Risk - Not RFI", $format);
$row++;

my $query = qq{
SELECT
v_config_report.`Build Responsibility`,
sum(if(v_config_report.Area = 'Inner',v_config_report.Sites,0)) as 'Inner',
sum(if(v_config_report.Area = 'MOR',v_config_report.Sites,0)) as 'MORAN',
sum(1) as 'Total'
FROM
v_config_report
WHERE
(v_config_report.`Macro, IBC or Repeater` = 'Macro - Vodafone'
or v_config_report.`Macro, IBC or Repeater` = 'Macro - Optus')
and v_config_report.RFI = 'no'
GROUP BY
v_config_report.`Build Responsibility`
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


my @fields = $sth->{NAME};
my $col = $second_col;
foreach my $field (@fields) {
            $worksheet->write($row, $col, $field, $format);
            $col++;
}
$row++;

while (my (@XLSarray) = $sth->fetchrow_array())
{
# Do some conversion stuff...
my $col = $second_col;
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
}

$sth->finish();


$row = 21;
$worksheet->write($row,$second_col, "IBC - Sole Risk - Not RFI", $format);
$row++;

my $query = qq{
SELECT
v_config_report.`Build Responsibility`,
sum(if(v_config_report.Area = 'Inner',v_config_report.Sites,0)) as 'Inner',
sum(if(v_config_report.Area = 'MOR',v_config_report.Sites,0)) as 'MORAN',
sum(1) as 'Total'
FROM
v_config_report
WHERE
(v_config_report.`Macro, IBC or Repeater` = 'IBC - Vodafone'
or v_config_report.`Macro, IBC or Repeater` = 'IBC - Optus')
and v_config_report.RFI = 'no'
GROUP BY
v_config_report.`Build Responsibility`
};

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


my @fields = $sth->{NAME};
my $col = $second_col;
foreach my $field (@fields) {
            $worksheet->write($row, $col, $field, $format);
            $col++;
}
$row++;

while (my (@XLSarray) = $sth->fetchrow_array())
{
# Do some conversion stuff...
my $col = $second_col;
        foreach my $XLSelement (@XLSarray) {
            if($XLSelement =~ m!^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$!) {
                my ($year,$month,$day) = split (/-/,$XLSelement);
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


########################################################################################################################################################

my $query = qq{SELECT * FROM v_deployment_summary};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();
my $worksheet = $workbook->addworksheet("Dashboard");
my $row = 4;
$worksheet->write(0,0, "Date Created", $format);
$worksheet->write(1,0, DateTime->now( time_zone => 'Australia/Sydney' ), $format);
$worksheet->write(2,0, "JVO Dashboard", $format);
$worksheet->write(3,0, "Deployment Summary", $format);

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
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
}

$sth->finish();


#$row++;
#$worksheet->write($row,0, "Split Program Summary - Forecast", $format);
#$row++;
#
#my $query = qq{
#SELECT * from v_split_summary
#};
#
## Build a query...
#my $sth = $dbh->prepare($query);
#$sth->execute();
#
#
#my @fields = $sth->{NAME};
#my $col = 0;
#foreach my $field (@fields) {
#            $worksheet->write($row, $col, $field, $format);
#            $col++;
#}
#$row++;
#
#while (my (@XLSarray) = $sth->fetchrow_array())
#{
## Do some conversion stuff...
#        my $col = 0;
#        foreach my $XLSelement (@XLSarray) {
#            if($XLSelement =~ m!^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$!) {
#                my ($year,$month,$day) = split (/-/,$XLSelement);
#                my $dt = DateTime->new( year => $year, month => $month, day => $day);
#                $worksheet->write_date_time($row, $col, $dt, $date_format);
#            } else {
#            $worksheet->write($row, $col, $XLSelement);
#            };
#            $col++;
#        }
#        $row++;
#}
#
#$sth->finish();
#
#$worksheet->write($row,0, "Split Program Summary - Actual", $format);
#$row++;
#
#my $query = qq{
#SELECT * from v_split_actual_summary
#};
##print "$query\n";
#
## Build a query...
#my $sth = $dbh->prepare($query);
#$sth->execute();
#
#
#while (my (@XLSarray) = $sth->fetchrow_array())
#{
## Do some conversion stuff...
#        my $col = 0;
#        foreach my $XLSelement (@XLSarray) {
#            if($XLSelement =~ m!^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$!) {
#                my ($year,$month,$day) = split (/-/,$XLSelement);
#                my $diff = $epoch - $dt;
#                $worksheet->write_date_time($row, $col, $dt, $date_format);
#            } else {
#            $worksheet->write($row, $col, $XLSelement);
#            };
#            $col++;
#        }
#        $row++;
#}
#
#$sth->finish();

$row++;
$worksheet->write($row,0, "SPIN Summary - Spins Opened", $format);
$row++;

my $query = qq{
SELECT * from v_spin_summary_open
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


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
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
}

$sth->finish();

$worksheet->write($row,0, "SPIN Summary - Spins Closed", $format);
$row++;

my $query = qq{
SELECT * from v_spin_summary_closed
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();

while (my (@XLSarray) = $sth->fetchrow_array())
{
# Do some conversion stuff...
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
}

$sth->finish();



$row++;
$worksheet->write($row,0, "Transmission Summary - E1 Capacity Changes", $format);
$row++;

my $query = qq{
SELECT * from v_transmission_summary_atm
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


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
                $worksheet->write_date_time($row, $col, $dt, $date_format);
            } else {
            $worksheet->write($row, $col, $XLSelement);
            };
            $col++;
        }
        $row++;
}

$sth->finish();

$worksheet->write($row,0, "Transmission Summary - IP Capacity Changes", $format);
$row++;

my $query = qq{
SELECT * from v_transmission_summary_ip
};
#print "$query\n";

# Build a query...
my $sth = $dbh->prepare($query);
$sth->execute();


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