#!/usr/bin/perl -w
#use strict;

use Switch;

#my $input_name = "C:\\Users\\Keith\\Documents\\My\ Dropbox\\JV\\Reports\\Software\\transmission_dates.csv";
#my $input_name = "M:\\Reports\\Database\\Import\\Optus_Import.csv";
my $input_name = "~/Dropbox/JV/Reports/Database/Import/Optus_Import.csv";
my $output_name = "~/Dropbox/JV/Reports/Database/Import/Optus_Output.csv";
#my $output_name = "M:\\Reports\\Database\\Import\\Optus_Output.csv";
my $current_site_id = "";
my $current_wa_id = 0;
my $true = "True";
my $false = "False";
my $node_number = 0;

#################
## data format ##
#################
### jv_site_number	site_name	site_number	wa_status	work_type	program_year_build	pccs_forecast_date	pccs_actual_date	sae_forecast_date	sae_actual_date	cws_forecast_date	cws_actual_date	pc_forecast_date	pc_actual_date	tx_forecast_date	tx_actual_date	op_rfi_forecast_date	op_rfi_actual_date	WA_ID	equip_forecast_date	equip_actual_date                       
system "rm $input_name";
system "rm $output_name";

#system "C:\\cygwin\\bin\\ls.exe -tr M:\\Reports\\Database\\Import\\JV_newsite_IBC_current_* | C:\\cygwin\\bin\\tail.exe 1 | C:\\cygwin\\bin\\xargs.exe -it cp $1\{\} M:\\Reports\\Database\\Import\\JV_newsite_IBC_current_latest";
#system "C:\\cygwin\\bin\\sort.exe -k 1,1 -k 19,19 -t, M:\\Reports\\Database\\Import\\JV_newsite_IBC_current_latest.csv > M:\\Reports\\Database\\Import\\Optus_Import.csv";
#system "C:\\cygwin\\bin\\touch.exe $output_name";
system "sort -k 1,1 -k 19,19 -t, ~/Dropbox/JV/Reports/Database/Import/JV_newsite_IBC_current_latest.csv > $input_name";
system "touch $output_name";

open INPUT_FILE, "/home/keith/Dropbox/JV/Reports/Database/Import/Optus_Import.csv" or die $!;
#my $line = <INPUT_FILE>; # read header line   --- no longer needed - sort puts it at end

open OUTPUT_FILE, ">/home/keith/Dropbox/JV/Reports/Database/Import/Optus_Output.csv" or die $!;

print OUTPUT_FILE "JV_Site_ID, node_number, milestone_id, PFA, milestone_date, wa_id\n";

while (my $line = <INPUT_FILE>) {
    chomp($line);
    
    my $milestone_id = 0;
    my $pfa = "";
    my $milestone_date = 0;
    
    (my $site_id,
     my $site_name,
     my $site_number,
     my $wa_status,
     my $work_type,
     my $program_year_build,
     my $pccs_forecast_date,
     my $pccs_actual_date,
     my $sae_forecast_date,
     my $sae_actual_date,
     my $cws_forecast_date,
     my $cws_actual_date,
     my $pc_forecast_date,
     my $pc_actual_date,
     my $tx_forecast_date,
     my $tx_actual_date,
     my $op_rfi_forecast_date,
     my $op_rfi_actual_date,
     my $wa_id,
     my $equip_forecast_date,
     my $equip_actual_date
     )
        = split(/,/,$line);
    
    #chomp($tx_source_programme_id);
    print "$site_id , $work_type\n";
    if ($site_id ne $current_site_id) {
        $current_site_id = $site_id;
        $node_number = 1;
		print "new site : $node_number\n";
    }
	if ($work_type =~ /Overbuild/) {
		goto END_OF_LOOP;
		};
	
    if ($work_type =~ /Split/) {
        $current_wa_id = $wa_id;
        $node_number++;
		print "split site : $node_number\n";		
    }
    #print "$pccs_forecast_date,$pccs_actual_date,$sae_forecast_date,$sae_actual_date,$cws_forecast_date,$cws_actual_date,$pc_forecast_date,$pc_actual_date,$tx_forecast_date,$tx_actual_date,$op_rfi_forecast_date,$op_rfi_actual_date,$wa_id,$equip_forecast_date,$equip_actual_date\n";
     
    if ($pccs_forecast_date)
        {
            my $pfa = "Forecast";
            my $milestone_id = 1;
            my $milestone_date = $pccs_forecast_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }
    if ($pccs_actual_date)
        {
            my $pfa = "Actual";
            my $milestone_id = 1;
            my $milestone_date = $pccs_actual_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }
    if ($sae_forecast_date)
        {
            my $pfa = "Forecast";
            my $milestone_id = 2;
            my $milestone_date = $sae_forecast_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }
    if ($sae_actual_date)
        {
            my $pfa = "Actual";
            my $milestone_id = 2;
            my $milestone_date = $sae_actual_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }   
    if ($cws_forecast_date)
        {
            my $pfa = "Forecast";
            my $milestone_id = 3;
            my $milestone_date = $cws_forecast_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }
    if ($cws_actual_date)
        {
            my $pfa = "Actual";
            my $milestone_id = 3;
            my $milestone_date = $cws_actual_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }   
    if ($pc_forecast_date)
        {
            my $pfa = "Forecast";
            my $milestone_id = 4;
            my $milestone_date = $pc_forecast_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }
    if ($pc_actual_date)
        {
            my $pfa = "Actual";
            my $milestone_id = 4;
            my $milestone_date = $pc_actual_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }   
    if ($tx_forecast_date)
        {
            my $pfa = "Forecast";
            my $milestone_id = 5;
            my $milestone_date = $tx_forecast_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }
    if ($tx_actual_date)
        {
            my $pfa = "Actual";
            my $milestone_id = 5;
            my $milestone_date = $tx_actual_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }   
    if ($op_rfi_forecast_date)
        {
            my $pfa = "Forecast";
            my $milestone_id = 6;
            my $milestone_date = $op_rfi_forecast_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }
    if ($op_rfi_actual_date)
        {
            my $pfa = "Actual";
            my $milestone_id = 6;
            my $milestone_date = $op_rfi_actual_date;
            print OUTPUT_FILE "$site_id, $node_number, $milestone_id, $pfa, $milestone_date, $wa_id\n" ;
        }   
    #exit;
	END_OF_LOOP:
}
