#!/usr/bin/perl
use File::Copy;
use File::Path;
use File::Basename;
use Digest::MD5 qw(md5 md5_hex md5_base64);

unlink '/tmp/t1.csv';
unlink '/tmp/t2.csv';
unlink '/tmp/t3.csv';


system "mysql galileo < /home/keith/Reporting/bin/recharge.sql";
system "mysql galileo < /home/keith/Reporting/bin/recharge_prev.sql";

#open F1,"</tmp/t1.csv";
#open F2,"</tmp/t2.csv";
#open F3,">/tmp/t3.csv";
##
#@f1 = <F1>;
#@f2 = <F2>;
#
#foreach $line (@f1) {
#    chomp($line);
#    $found = 0;
#    $line_md5 = md5($line);
#    foreach $check (@f2) {
#    chomp($check);
#        $check_md5 = md5($check);
#        if($line_md5 == $check_md5) {
#            $found = 1;
#        };
#    };
#    if($found==0){
#    print F3 "$line, New \n";
#    };
#
#};
#
#@f1 = <F1>;
#@f2 = <F2>;
#
#foreach $line (@f2) {
#    $found = 0;
#    chomp($line);
#    $line_md5 = md5($line);
#    foreach $check (@f1) {
#        chomp($check);
#        $check_md5 = md5($check);
#        if($line_md5 == $check_md5) {
#            $found = 1;
#        };
#    };
#    if($found==0){
#    print F3 "$line, Old \n";
#
#    };
#};
#
#close F1;
#close F2;
#close F3;
#
#system "sort -n /tmp/t3.csv > /home/keith/Dropbox/JV/Reports/Software/Reporting/public/reports/recharge/recharge_report_changes_`date +%Y_%m_%d`.csv";
#system "chown keith:keith /home/keith/Dropbox/JV/Reports/Software/Reporting/public/reports/recharge/recharge_report_changes_`date +%Y_%m_%d`.csv";
#

system "diff -d -w /tmp/t1.csv /tmp/t2.csv | sed 's/</New\,/' | sed 's/>/Old\,/' | sed 's/\-\-\-//' | egrep -i 'New|Old' > /home/keith/Dropbox/JV/Reports/Software/Reporting/public/reports/recharge/recharge_changes_`date +%Y_%m_%d`.csv";
system "chown keith:keith /home/keith/Dropbox/JV/Reports/Software/Reporting/public/reports/recharge/recharge_changes_`date +%Y_%m_%d`.csv";


