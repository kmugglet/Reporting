#!/usr/bin/perl -w

use strict;
use Spreadsheet::Read;

my $oExcel = new Spreadsheet::ParseExcel;

die "You must provide a filename to $0 to be parsed as an Excel file" unless @ARGV;

# ARG 0 is input filename
# ARG 1 is output filename
# ARG 2 is name of worksheet to parse

my $input_xls = "$ARGV[0]";
my $output_csv = "$ARGV[1]";
my $worksheet_name = "$ARGV[2]";
my $sheet_count;

chomp($worksheet_name);
chomp($output_csv);
chomp($input_xls);
print "$input_xls, $output_csv, $worksheet_name \n";
open OUTCSV, ">$output_csv";
my $oBook = $oExcel->Parse($input_xls);
my($iR, $iC, $oWkS, $oWkC);

$sheet_count = $oBook->{SheetCount} or $sheet_count = 1;
for(my $iSheet=0; $iSheet < $sheet_count ; $iSheet++) {
     $oWkS = $oBook->{Worksheet}[$iSheet];
     if (($oWkS->{Name} eq $worksheet_name) + ($worksheet_name eq '1')) {print "foo"};
     if (($oWkS->{Name} eq $worksheet_name) + ($worksheet_name eq '1')) {
         for(my $iR = $oWkS->{MinRow} ; defined $oWkS->{MaxRow} && $iR <= $oWkS->{MaxRow} ; $iR++) {
            for(my $iC = $oWkS->{MinCol} ; defined $oWkS->{MaxCol} && $iC <= $oWkS->{MaxCol} ;$iC++) {
                $oWkC = $oWkS->{Cells}[$iR][$iC];
                if($oWkC) {
                    print OUTCSV $oWkC->Value, ";"
                } else {
                    print OUTCSV ";"
                }
            }
            print OUTCSV "\n"
         }
     }
}
close OUTCSV;
