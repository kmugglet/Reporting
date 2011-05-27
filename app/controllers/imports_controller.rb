class ImportsController < ApplicationController
  # GET /imports
  # GET /imports.xml
  def index
    @imports = Import.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @imports }
    end
  end

  # GET /imports/1
  # GET /imports/1.xml
  def edit
    @import = Import.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.xml { render :xml => @import }
    end
  end

  def show
    redirect_to :action => "index"
  end

  # GET /imports/new
  # GET /imports/new.xml
  def new
    session[:root_dir]='/home/keith/Reporting/'
    session[:debug_on] = false
    @error_messages = Array.new
    @import = Import.new
    attachment = @import.documents.build


    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @import }
    end
  end

  # GET /imports/1/edit
  # POST /imports
  # POST /imports.xml
  def create
    @error_messages = Array.new
    debugger if session[:debug_on]
    @import = Import.new(params[:import])
    attachment = @import.documents.first
    @import.user_id = session[:user_id]
    action = params[:commit]
    respond_to do |format|
      if @import.save

        format.html { redirect_to(@import) }
        format.xml { render :xml => @import, :status => :created, :location => @import }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @import.errors, :status => :unprocessable_entity }
      end
    end
    if params[:import][:documents_attributes]
      @document = @import.documents.last
      @import.data_type = @document.filename
      @import.save
      debugger if session[:debug_on]
      system "/usr/bin/mysql galileo -u pma --password=Spinoza123 -h 192.168.0.250  < /home/keith/Reporting/bin/update_latest_milestone_dates.sql"

      case action
        when 'Import VHA Milestones'
          @results = import_vha_data(@document)
        when 'Import Optus Milestones'
          @results = import_optus_data(@document)
        when 'Import Transmission Data'
          @results = import_tx_data(@document)
      end

      if @results.blank?
        flash[:notice] = 'Data was successfully imported.'
      else
        error_message = ''
        puts @results
      end
    end
    system "/usr/bin/mysql galileo -u pma --password=Spinoza123 -h 192.168.0.250 < /home/keith/Reporting/bin/update_latest_milestone_dates.sql"

  end

# PUT /imports/1
# PUT /imports/1.xml
  def update
    @import = Import.find(params[:id])

    respond_to do |format|
      if @import.update_attributes(params[:import])
        flash[:notice] = 'Import was successfully updated.'
        format.html { redirect_to(@import) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @import.errors, :status => :unprocessable_entity }
      end
    end
  end

# DELETE /imports/1
# DELETE /imports/1.xml
  def destroy
    @import = Import.find(params[:id])
    @import.destroy

    respond_to do |format|
      format.html { redirect_to(imports_url) }
      format.xml { head :ok }
    end
  end

  def import_optus_data(uploaded_file)
    @error_messages = Array.new
    session[:root_dir]='/home/keith/Reporting/'
    session[:debug_on] = false
=begin
Data definition example  column - title - example data
0	  jv_site_number	        JA9001	                      JA9005	  JA9005	                JA9010
1	  site_name	              ADELAIDE CALL CENTRE -O	      UNLEY -O	UNLEY -O	              KILKENNY -V
2	  site_number	            A0177	                        A0158	    A0158	                  A0299
3	  wa_status	              Complete	                    Current	  Current	                Current
4	  work_type	              In Building	                  New Site	NWR - F2 NODE B Split	  NWR - F2 Overbuild
5	  program_year_build	    05/06'	                      06/07'	  09/10'	                08/09'
6	  pccs_forecast_date	    23-JUN-05	                    16-FEB-06	09-DEC-09	              30-JAN-09
7	  pccs_actual_date	      23-JUN-05	                    16-FEB-06	09-DEC-09	              30-JAN-09
8	  sae_forecast_date	      22-JUL-05	                    31-MAR-06	09-DEC-09	              23-FEB-09
9	  sae_actual_date	        22-JUL-05	31-MAR-06	09-DEC-09	23-FEB-09
10	cws_forecast_date		    31-MAR-06	09-DEC-09	23-FEB-09
11	cws_actual_date		      31-MAR-06	09-DEC-09	23-FEB-09
12	pc_forecast_date	      08-AUG-05	27-APR-06	09-DEC-09	23-FEB-09
13	pc_actual_date	        08-AUG-05	27-APR-06	09-DEC-09	23-FEB-09
14	tx_forecast_date		    18-APR-06	06-JAN-10	10-MAR-09
15	tx_actual_date		      18-APR-06	06-JAN-10	10-MAR-09
16	op_rfi_forecast_date	  08-AUG-05	01-MAY-06	22-FEB-10	10-MAR-09
17	op_rfi_actual_date	    08-AUG-05	01-MAY-06	22-FEB-10	10-MAR-09
18	WA_ID	                  34086	                        12376	    80289	                  69517
19	equip_forecast_date		  26-APR-06	22-FEB-10	10-MAR-09
20	equip_actual_date                       	                                                                                                                                                                                                 	26-APR-06                                                                                                                                                              	22-FEB-10                                                                                                                                                 	10-MAR-09

=end
    debugger if session[:debug_on]
    uploaded_file.uploaded = true
    uploaded_file.user_id = session[:user_id].to_i
    uploaded_file.comments = 'Optus Milestone Data'
    uploaded_file.save!
    root_dir = session[:root_dir]
    filename = uploaded_file.filename
    doc_id = uploaded_file.id
    spin_id = uploaded_file.spin_id
    doc_id = "00000000" + doc_id.to_s
    doc_id = doc_id[-9..-1]
    base_dir = "#{root_dir}public/documents/"
    base_dir = base_dir + doc_id[1..4] + '/' + doc_id[5..8] + '/'
    stored_filename = base_dir + filename
    extension = filename[-6..-1]
    start_pos = extension.index('.')
    extension = extension[start_pos..20]
    if extension.downcase != '.csv'
      flash[:error] = "Optus Milestone Data input file must be in csv format"
      return
    end
    row_number = 0
    original_node = true
    file = File.new(stored_filename, 'r')
    session[:inserts] = 0
    log_file = File.new("#{root_dir}public/reports/logs/import_#{Date.today}.log", 'a')
    log_file.puts Time.now.to_s
    log_file.puts stored_filename
    count = `wc -l < #{stored_filename}`
    fail "wc failed: #{$?}" if $? != 0
    count.chomp!

    file.each_line("\n") do |row|
      debugger if session[:debug_on]
      row.gsub! /\"/, ''
      row.chomp!
      column = row.split(",")
      site_id = column[0]
      jv_site = site_id

      site_name = column[1]
      site_number = column[2]
      wa_status = column[3]
      work_type = column[4]
      program_year_build = column[5]

      pccs_forecast_date = column[6].to_s
      pccs_actual_date = column[7].to_s
      sae_forecast_date = column[8].to_s
      sae_actual_date = column[9].to_s
      cws_forecast_date = column[10].to_s
      cws_actual_date = column[11].to_s
      pc_forecast_date = column[12].to_s
      pc_actual_date = column[13].to_s
      tx_forecast_date = column[14].to_s
      tx_actual_date = column[15].to_s
      op_rfi_forecast_date = column[16].to_s
      op_rfi_actual_date = column[17].to_s
      wa_id = column[18]
=begin
			equip_forecast_date = column[19]
			equip_actual_date = column[20]
=end


      debugger if session[:debug_on]
      row_number+=1
      puts "#{row_number}/#{count}" if session[:debug_on]
      puts '----------------------------------------------------- start new row ----------------------------------------------------' if session[:debug_on]
      #puts 'row number', row_number , 'row data', column
      blank_row = true
      debugger if session[:debug_on]
      if row_number > 1
        debugger if session[:debug_on]
        for column_id in (0...31)
          #print 'column [', column_id, '] : ', column[column_id] if session[:debug_on]
          #puts "" if session[:debug_on]
          blank_row = false unless column[column_id].blank?
        end

        next if blank_row

=begin
				do the magic
=end
        debugger if session[:debug_on]

        @node = Node.first(:conditions => ['wa_id = ? and original_node = ?', wa_id, original_node])
        if @node.blank?
          log_file.puts "Cannot find matching node for WA_ID "+wa_id.to_s+", import file says "+ site_id + " - " + site_name
          next
        end
        node_id = @node['id']


        # Actuals
        unless pccs_actual_date.blank?
          exists = existing_milestone(node_id, "Actual", 1, "%")
          update_milestone_import(node_id, "Actual", 1, filename)
          if exists
            same_date = existing_milestone(node_id, "Actual", 1, pccs_actual_date)
            unless same_date
              log_file.puts 'S1 Actual exists,ignoring changes for '+jv_site.to_s+' node_id:'+node_id.to_s
            end
          else
            insert_milestone(node_id, "Actual", 1, pccs_actual_date, filename)
          end
        end

        unless sae_actual_date.blank?
          exists = existing_milestone(node_id, "Actual", 2, "%")
          update_milestone_import(node_id, "Actual", 2, filename)
          if exists
            same_date = existing_milestone(node_id, "Actual", 2, sae_actual_date)
            unless same_date
              log_file.puts 'S2 Actual exists,ignoring changes for '+jv_site.to_s+' node_id:'+node_id.to_s
            end
          else
            insert_milestone(node_id, "Actual", 2, sae_actual_date, filename)
          end
        end

        unless cws_actual_date.blank?
          exists = existing_milestone(node_id, "Actual", 3, "%")
          update_milestone_import(node_id, "Actual", 3, filename)
          if exists
            same_date = existing_milestone(node_id, "Actual", 3, cws_actual_date)
            unless same_date
              log_file.puts 'S3 Actual exists,ignoring changes for '+jv_site.to_s+' node_id:'+node_id.to_s
            end
          else
            insert_milestone(node_id, "Actual", 3, cws_actual_date, filename)
          end
        end

        unless pc_actual_date.blank?
          exists = existing_milestone(node_id, "Actual", 4, "%")
          update_milestone_import(node_id, "Actual", 4, filename)
          if exists
            same_date = existing_milestone(node_id, "Actual", 4, pc_actual_date)
            unless same_date
              log_file.puts 'S4 Actual exists,ignoring changes for '+jv_site.to_s+' node_id:'+node_id.to_s
            end
          else
            insert_milestone(node_id, "Actual", 4, pc_actual_date, filename)
          end
        end

        unless tx_actual_date.blank?
          exists = existing_milestone(node_id, "Actual", 5, "%")
          update_milestone_import(node_id, "Actual", 5, filename)
          if exists
            same_date = existing_milestone(node_id, "Actual", 5, tx_actual_date)
            unless same_date
              log_file.puts 'S5 Actual exists,ignoring changes for '+jv_site.to_s+' node_id:'+node_id.to_s
            end
          else
            insert_milestone(node_id, "Actual", 5, tx_actual_date, filename)
          end
        end

        unless op_rfi_actual_date.blank?
          exists = existing_milestone(node_id, "Actual", 6, "%")
          update_milestone_import(node_id, "Actual", 6, filename)
          if exists
            same_date = existing_milestone(node_id, "Actual", 6, op_rfi_actual_date)
            unless same_date
              log_file.puts 'S6 Actual exists,ignoring changes for '+jv_site.to_s+' node_id:'+node_id.to_s
            end
          else
            insert_milestone(node_id, "Actual", 6, op_rfi_actual_date, filename)
          end
        end

        # Forecasts
        unless pccs_forecast_date.blank?
          exists = existing_milestone(node_id, "Forecast", 1, "%")
          update_milestone_import(node_id, "Forecast", 1, filename)
          if exists
            same_date = existing_milestone(node_id, "Forecast", 1, pccs_forecast_date)
            unless same_date
              new = Date.strptime(pccs_forecast_date, '%d-%b-%y')
              diff = new - exists
              log_file.puts "S1 Forecast has changed from #{exists} by #{diff} days to #{new} for #{jv_site.to_s}, node_id: #{node_id.to_s}"
              insert_milestone(node_id, "Forecast", 1, pccs_forecast_date, filename)
            end
          else
            insert_milestone(node_id, "Forecast", 1, pccs_forecast_date, filename)
          end
        end

        unless sae_forecast_date.blank?
          exists = existing_milestone(node_id, "Forecast", 2, "%")
          update_milestone_import(node_id,"Forecast", 2, filename )
          if exists
            same_date = existing_milestone(node_id, "Forecast", 2, sae_forecast_date)
            unless same_date
              new = Date.strptime(sae_forecast_date, '%d-%b-%y')
              diff = new - exists
              log_file.puts "S2 Forecast has changed from #{exists} by #{diff} days to #{new} for #{jv_site.to_s}, node_id: #{node_id.to_s}"
              insert_milestone(node_id, "Forecast", 2, sae_forecast_date, filename)
            end
          else
            insert_milestone(node_id, "Forecast", 2, sae_forecast_date, filename)
          end
        end

        unless cws_forecast_date.blank?
          exists = existing_milestone(node_id, "Forecast", 3, "%")
          update_milestone_import(node_id,"Forecast", 3, filename )
          if exists
            same_date = existing_milestone(node_id, "Forecast", 3, cws_forecast_date)
            unless same_date
              new = Date.strptime(cws_forecast_date, '%d-%b-%y')
              diff = new - exists
              log_file.puts "S3 Forecast has changed from #{exists} by #{diff} days to #{new} for #{jv_site.to_s}, node_id: #{node_id.to_s}"
              insert_milestone(node_id, "Forecast", 3, cws_forecast_date, filename)
            end
          else
            insert_milestone(node_id, "Forecast", 3, cws_forecast_date, filename)
          end
        end

        #comment

        unless pc_forecast_date.blank?
          exists = existing_milestone(node_id, "Forecast", 4, "%")
          update_milestone_import(node_id,"Forecast", 4, filename )
          if exists
            same_date = existing_milestone(node_id, "Forecast", 4, pc_forecast_date)
            unless same_date
              new = Date.strptime(pc_forecast_date, '%d-%b-%y')
              diff = new - exists
              log_file.puts "S4 Forecast has changed from #{exists} by #{diff} days to #{new} for #{jv_site.to_s}, node_id: #{node_id.to_s}"
              insert_milestone(node_id, "Forecast", 4, pc_forecast_date, filename)
            end
          else
            insert_milestone(node_id, "Forecast", 4, pc_forecast_date, filename)
          end
        end

        unless tx_forecast_date.blank?
          exists = existing_milestone(node_id, "Forecast", 5, "%")
          update_milestone_import(node_id,"Forecast", 5, filename )
          if exists
            same_date = existing_milestone(node_id, "Forecast", 5, tx_forecast_date)
            unless same_date
              new = Date.strptime(tx_forecast_date, '%d-%b-%y')
              diff = new - exists
              log_file.puts "S5 Forecast has changed from #{exists} by #{diff} days to #{new} for #{jv_site.to_s}, node_id: #{node_id.to_s}"
              insert_milestone(node_id, "Forecast", 5, tx_forecast_date, filename)
            end
          else
            insert_milestone(node_id, "Forecast", 5, tx_forecast_date, filename)
          end
        end

        unless op_rfi_forecast_date.blank?
          exists = existing_milestone(node_id, "Forecast", 6, "%")
          update_milestone_import(node_id,"Forecast", 6, filename )
          if exists
            same_date = existing_milestone(node_id, "Forecast", 6, op_rfi_forecast_date)
            unless same_date
              new = Date.strptime(op_rfi_forecast_date, '%d-%b-%y')
              diff = new - exists
              log_file.puts "S6 Forecast has changed from #{exists} by #{diff} days to #{new} for #{jv_site.to_s}, node_id: #{node_id.to_s}"
              insert_milestone(node_id, "Forecast", 6, op_rfi_forecast_date, filename)

            end
          else
            insert_milestone(node_id, "Forecast", 6, op_rfi_forecast_date, filename)
          end
        end
      end
    end
    log_file.puts "Parsed #{row_number} lines of input file"
    log_file.puts "Added #{session[:inserts]} new records"
    log_file.puts Time.now.to_s
    log_file.puts "----------------------------------------------------------------------------"
    log_file.close
    @error_messages
  end

  def insert_milestone(node_id, pfa, milestone_id, milestone_date, filename)
    debugger if session[:debug_on]
    exists = existing_milestone(node_id, pfa, milestone_id, milestone_date)
    unless exists
      ms = MilestoneDate.new
      ms.pfa = pfa
      ms.node_id = node_id
      ms.milestone_id = milestone_id
      ms.milestone_date = Date.strptime(milestone_date, '%d-%b-%y').strftime('%Y-%m-%d')
      ms.milestone_source = filename
      if ms.save!
        #puts "Data inserted #{ms.node_id},  #{pfa}, #{ms.milestone_id}, #{milestone_date}"
        session[:inserts] = session[:inserts] + 1
      end
    end
  end

  def existing_milestone(node_id, pfa, milestone_id, milestone_date)
    unless milestone_date == '%'
      milestone_date = '0'+milestone_date
      milestone_date = milestone_date[-9..-1]
      milestone_date = milestone_date.downcase
    end

    exists = LatestMilestoneDate.first(:conditions => ["node_id = ? and pfa = ? and milestone_id = ? and lower(date_format(milestone_date,'%d-%b-%y')) like ?", node_id, pfa, milestone_id, milestone_date])
    milestone_exists = false
    unless exists.blank?
      milestone_exists = exists.milestone_date
    end
    milestone_exists
  end

  def update_milestone_import(node_id, pfa, milestone_id, filename)
    #debugger
    #@mi = MilestoneImport.first(:conditions => ["node_id = ? and pfa = ? and milestone_id = ?", node_id, pfa, milestone_id])
    @mi = MilestoneImport.find_by_sql("select * from milestone_imports where node_id = #{node_id} and milestone_id = #{milestone_id} and pfa = '#{pfa}' limit 1 ")
    if @mi.blank?
      @mi = MilestoneImport.new
      @mi.node_id = node_id
      @mi.pfa = pfa
      @mi.milestone_id = milestone_id
      @mi.filename = filename
      if @mi.save

      end
    else
      @mi[0].filename = filename
      if @mi[0].save

      end
    end
  end

  def import_vha_data(uploaded_file)

    session[:root_dir]='/home/keith/Reporting/'
    session[:debug_on] = true
=begin
Data definition example  column - title - example data

=end
    debugger if session[:debug_on]
    uploaded_file.uploaded = true
    uploaded_file.user_id = session[:user_id].to_i
    uploaded_file.comments = 'VHA Milestone Data'
    uploaded_file.save!

    root_dir = session[:root_dir]
    filename = uploaded_file.filename
    doc_id = uploaded_file.id
    spin_id = uploaded_file.spin_id
    doc_id = "00000000" + doc_id.to_s
    doc_id = doc_id[-9..-1]
    base_dir = "#{root_dir}public/documents/"
    base_dir = base_dir + doc_id[1..4] + '/' + doc_id[5..8] + '/'
    stored_filename = base_dir + filename
    extension = filename[-6..-1]
    start_pos = extension.index('.')
    extension = extension[start_pos..20]
    row_number = 0
    tmp_filename = "tmpFile#{uploaded_file['id'].to_s}.csv"
    command_line = "perl #{root_dir}bin/read_spreadsheet.pl "+stored_filename+" #{root_dir}bin/"+tmp_filename+" 1"
    puts command_line
    system command_line
    csv_filename = "#{root_dir}bin/#{tmp_filename}"
    session[:inserts] = 0
    log_file = File.new("#{root_dir}public/reports/logs/import_#{Date.today}.log", 'a')
    log_file.puts Time.now.to_s
    log_file.puts stored_filename
    original_node = true
    if filename.downcase.scan(/split/).empty? and filename.downcase.scan(/nodeb/).empty?
      @node_owner = 'Vodafone'
    else
      @node_owner = 'Optus'
      original_node = false
    end
    file = File.new(csv_filename, 'r') or log_file.puts "Cannot open file #{csv_filename}, check #{stored_filename} is valid"
    count = `wc -l < #{stored_filename}`
    fail "wc failed: #{$?}" if $? != 0
    count.chomp!

    file.each_line("\n") do |row|
      column = row.split(";")

      debugger if session[:debug_on]
      row_number+=1
      puts "#{row_number}/#{count}" if session[:debug_on]
      puts '----------------------------------------------------- start new row ----------------------------------------------------' if session[:debug_on]
      #puts 'row number', row_number , 'row data', column
      blank_row = true
      if row_number > 1
        debugger if session[:debug_on]
        for column_id in (0...5)
          print 'column [', column_id, '] : ', column[column_id] if session[:debug_on]
          puts "" if session[:debug_on]
          blank_row = false unless column[column_id].blank?
        end

        next if blank_row

        jv_site = column[0]

        next if jv_site.blank?
        @sites = Site.find_all_by_jv_site(jv_site, :order => :id)
        @site = @sites.first
        @nodes = @site.nodes
        @node = @nodes.first(:conditions => ['original_node = ?', original_node], :order => 'node_number')
        if @node.blank?
          log_file.puts "Cannot find matching node, milestone is #{column[1]}, import file says "+ jv_site + ", original node should be " + original_node.to_s
          next
        end

        node_id = @node['id']
        site_id = @node['site_id']

        vha_milestone = column[1]

=begin
							Because the VHA date format changes from week to week we try each one in succession, 'rescue' traps the failed date conversion
=end

        next if vha_milestone.blank?
        milestone_name = Milestone.find_all_by_vha_name(vha_milestone)
        next if milestone_name.blank?

        milestone_id = milestone_name.first['id'].to_i
        milestone_code = milestone_name.first['name'].to_s

        planned = column[2]
        begin
          planned = Date.strptime(planned, '%d/%m/%Y').strftime('%d-%b-%y')
        rescue
          begin
            planned = Date.strptime(planned, '%m/%d/%Y').strftime('%d-%b-%y')
          rescue
            begin
              planned = Date.strptime(planned, '%Y-%m-%d').strftime('%d-%b-%y')
            rescue
              planned = nil
            end
          end
        end
        forecast = column[3]
        begin
          forecast = Date.strptime(forecast, '%d/%m/%Y').strftime('%d-%b-%y')
        rescue
          begin
            forecast = Date.strptime(forecast, '%m/%d/%Y').strftime('%d-%b-%y')
          rescue
            begin
              forecast = Date.strptime(forecast, '%Y-%m-%d').strftime('%d-%b-%y')
            rescue
              forecast = nil
            end
          end
        end
        actual = column[4]
        begin
          actual = Date.strptime(actual, '%d/%m/%Y').strftime('%d-%b-%y')
        rescue
          begin
            actual = Date.strptime(actual, '%m/%d/%Y').strftime('%d-%b-%y')
          rescue
            begin
              actual = Date.strptime(actual, '%Y-%m-%d').strftime('%d-%b-%y')
            rescue
              actual = nil
            end
          end
        end

        debugger if session[:debug_on]

        unless planned.blank?
          exists = existing_milestone(node_id, 'Planned', milestone_id, '%')
          update_milestone_import(node_id,"Planned", milestone_id, filename )

          if exists
            same_date = existing_milestone(node_id, "Planned", milestone_id, planned)
            unless same_date
              log_file.puts milestone_code + ' Planned exists, ignoring changes for '+jv_site.to_s+' node_id:'+node_id.to_s
            end
          else
            insert_milestone(node_id, "Planned", milestone_id, planned, filename)
          end
        end

        unless forecast.blank?
          exists = existing_milestone(node_id, 'Forecast', milestone_id, '%')
          update_milestone_import(node_id,"Forecast", milestone_id, filename )
          if exists
            same_date = existing_milestone(node_id, "Forecast", milestone_id, forecast)
            unless same_date
              new = Date.strptime(forecast, '%d-%b-%y')
              diff = new - exists
              log_file.puts milestone_code + " Forecast has changed from #{exists} by #{diff} days to #{new} for #{jv_site.to_s}, node_id: #{node_id.to_s}"
              insert_milestone(node_id, "Forecast", milestone_id, forecast, filename)
            end
          else
            insert_milestone(node_id, "Forecast", milestone_id, forecast, filename)
          end
        end

        unless actual.blank?
          exists = existing_milestone(node_id, 'Actual', milestone_id, '%')
          update_milestone_import(node_id,"Actual", milestone_id, filename )
          if exists
            same_date = existing_milestone(node_id, "Actual", milestone_id, actual)
            unless same_date
              log_file.puts milestone_code + ' Actual exists ignoring changes for '+jv_site.to_s+' node_id:'+node_id.to_s
            end
          else
            insert_milestone(node_id, "Actual", milestone_id, actual, filename)
          end
        end

      end
    end

    command_line = 'rm '+csv_filename
    system command_line
    log_file.puts "Parsed #{row_number} lines of input file"
    log_file.puts "Added #{session[:inserts]} new records"
    log_file.puts Time.now.to_s
    log_file.puts "----------------------------------------------------------------------------"
    log_file.close
    @error_messages
  end


  def import_tx_data(uploaded_file)
    @error_messages = Array.new
    session[:root_dir]='/home/keith/Reporting/'
    session[:debug_on] = false
=begin
Data definition example  column - title - example data
0 JV_Site_ID	              		JA9003	      	JA9003
1 Node_Number	              		1	        1
2 Active_Node_Owner	        	Joint	        Joint
3 Request_No	              		1	        11
4 Split_No	                	0	        0
5 Date_Raised		            			18/06/2007
6 Date_Required_By		      			31/08/2007
7 Orderer	                  	JVO	        JVO
8 Invoice_Party	            		Joint        	Joint
9 Work_Type	                	Initial	      	Upgrade
10  Technology_ATM_IP	      		ATM	        ATM
11  E1_Existing_Capacity	  	0	        2
12  E1_Required_Capacity	  	2            	3
13  S7_Baseline	            		19/07/2006	15/11/2007
14  S7_Forecast	            		19/07/2006	15/11/2007
15  S8_Baseline	            		19/07/2006	22/11/2007
16  S8_Forecast	            		19/07/2006	22/11/2007
17  S7_Actual		                          	15/11/2007
18  S8_Actual		                          	22/11/2007
19  C1_Cancelled
20  C2_Split
21  C3_Passed_to_Deployment
22  C4_Completed_by_Deployment		19/07/2006
23  Remarks
24  Bulk_Order_Type	        	blank	        VF Bulk Moran

=end
    debugger if session[:debug_on]
    uploaded_file.uploaded = true
    uploaded_file.user_id = session[:user_id].to_i
    uploaded_file.comments = 'Transmission Data'
    uploaded_file.save!

    root_dir = session[:root_dir]
    filename = uploaded_file.filename
    doc_id = uploaded_file.id
    spin_id = uploaded_file.spin_id
    doc_id = "00000000" + doc_id.to_s
    doc_id = doc_id[-9..-1]
    base_dir = "#{root_dir}public/documents/"
    base_dir = base_dir + doc_id[1..4] + '/' + doc_id[5..8] + '/'
    stored_filename = base_dir + filename
    extension = filename[-6..-1]
    start_pos = extension.index('.')
    extension = extension[start_pos..20]
    if extension.capitalize != '.csv'
      flash[:error] = "Transmission Data input file must be in csv format"
      return
    end
    row_number = 0
    file = File.new(stored_filename, 'r')

    count = `wc -l < #{stored_filename}`
    fail "wc failed: #{$?}" if $? != 0
    count.chomp!

    file.each_line("\n") do |row|
      debugger if session[:debug_on]
      row_number += 1
      row.gsub! /"/, ''
      column = row.split(",")

      jv_site = column[0]
      site_id = Site.find_all_by_jv_site(jv_site).first
      next if site_id.blank?
      site_id = site_id['id']
      node_number = column[1]
      node_data = Node.find_by_sql('select * from nodes where site_id = '+site_id.to_s+' and node_number = '+node_number.to_s).first
      next if node_data.blank?
      puts "#{row_number}/#{count}"
      #puts column
      node_id = node_data['id']
      active_node_owner = column[2]
      request_no = column[3]
      split_no = column[4].to_i
      date_raised = column[5]
      date_required_by = column[6]
      orderer = column[7]
      invoice_party = active_node_owner
      work_type = column[9]
      link_technology = column[10]
      technology = LinkTechnology.find_by_name(link_technology)
      technology = LinkTechnology.find_by_name("ATM") if technology.blank? ### default to ATM if not provided
      existing_capacity = column[11].to_i
      required_capacity = column[12].to_i
      s7_baseline = column[13]
      s7_forecast = column[14]
      s8_baseline = column[15]
      s8_forecast = column[16]
      s7_actual = column[17]
      s8_actual = column[18]
      c1 = column[19]
      c2 = column[20]
      c3 = column[21]
      c4 = column[22]
      comments = column[23]
      bulk_order_type = column[24]

      site_built_as_split = Node.find_by_sql('select * from v_sites_built_split where site_id = '+site_id.to_s).first
      if site_built_as_split.blank?
        site_built_as_split = false
      else
        site_built_as_split = true
      end
      debugger if session[:debug_on]

      node_has_been_split = Node.find_by_sql('select * from v_split_nodes where node_id = '+node_id.to_s).first
      if node_has_been_split.blank?
        node_has_been_split = false
      else
        node_has_been_split = true
      end

      unless site_built_as_split
        unless node_has_been_split
          if work_type == "Node Split"
            # Splitting an original Spinoza Joint Site
            debugger if session[:debug_on]
            existing_request = TransmissionDate.find_by_sql('select id from transmission_dates where node_id = '+node_id.to_s+' and request_no = '+request_no.to_s+' and split_no = '+split_no.to_s).first
            next if existing_request ### will do updates eventually
            if node_number.to_i == 1
              new_request = TransmissionDate.new
              new_request.node_id = node_id.to_i
              new_request.Work_Type = work_type
              new_request.Active_Node_Owner = "Joint"
              new_request.Invoice_Party = "Joint"
              new_request.date_raised = date_raised
              new_request.date_required_by = date_required_by
              new_request.Existing_Capacity = existing_capacity
              new_request.Required_Capacity = 0
              new_request.link_technology_id = technology['id']
              new_request.Request_No = request_no.to_i
              new_request.Split_No = split_no
              new_request.S7_Baseline = Date.strptime(s7_baseline, '%d/%m/%Y') unless s7_baseline.blank?
              new_request.S7_Forecast = Date.strptime(s7_forecast, '%d/%m/%Y') unless s7_forecast.blank?
              new_request.S7_Actual = Date.strptime(s7_actual, '%d/%m/%Y') unless s7_actual.blank?
              new_request.S8_Baseline = Date.strptime(s8_baseline, '%d/%m/%Y') unless s8_baseline.blank?
              new_request.S8_Forecast = Date.strptime(s8_forecast, '%d/%m/%Y') unless s8_forecast.blank?
              new_request.S8_Actual = Date.strptime(s8_actual, '%d/%m/%Y') unless s8_actual.blank?
              new_request.C1 = Date.strptime(c1, '%d/%m/%Y') unless c1.blank?
              new_request.C2 = Date.strptime(c2, '%d/%m/%Y') unless c2.blank?
              new_request.C3 = Date.strptime(c3, '%d/%m/%Y') unless c3.blank?
              new_request.C4 = Date.strptime(c4, '%d/%m/%Y') unless c4.blank?
              new_request.Remarks = comments
              new_request.save!

              next_request = TransmissionDate.new(new_request.attributes)
              next_request.Existing_Capacity = 0
              next_request.Required_Capacity = required_capacity
              next_request.Request_No = request_no.to_i + 0.1
              next_request.Active_Node_Owner = active_node_owner
              next_request.Invoice_Party = active_node_owner
              next_request.save!
            else ### second part of split request
              new_request = TransmissionDate.new
              new_request.node_id = node_id.to_i
              new_request.Active_Node_Owner = active_node_owner
              new_request.Invoice_Party = active_node_owner
              new_request.Work_Type = work_type
              new_request.date_raised = date_raised
              new_request.date_required_by = date_required_by
              new_request.Existing_Capacity = existing_capacity
              new_request.Required_Capacity = required_capacity
              new_request.link_technology_id = technology['id']
              new_request.Request_No = request_no.to_i
              new_request.Split_No = split_no
              new_request.S7_Baseline = Date.strptime(s7_baseline, '%d/%m/%Y') unless s7_baseline.blank?
              new_request.S7_Forecast = Date.strptime(s7_forecast, '%d/%m/%Y') unless s7_forecast.blank?
              new_request.S7_Actual = Date.strptime(s7_actual, '%d/%m/%Y') unless s7_actual.blank?
              new_request.S8_Baseline = Date.strptime(s8_baseline, '%d/%m/%Y') unless s8_baseline.blank?
              new_request.S8_Forecast = Date.strptime(s8_forecast, '%d/%m/%Y') unless s8_forecast.blank?
              new_request.S8_Actual = Date.strptime(s8_actual, '%d/%m/%Y') unless s8_actual.blank?
              new_request.C1 = Date.strptime(c1, '%d/%m/%Y') unless c1.blank?
              new_request.C2 = Date.strptime(c2, '%d/%m/%Y') unless c2.blank?
              new_request.C3 = Date.strptime(c3, '%d/%m/%Y') unless c3.blank?
              new_request.C4 = Date.strptime(c4, '%d/%m/%Y') unless c4.blank?
              new_request.Remarks = comments
              new_request.save!
            end

          else
            # work type is initial or upgrade
            debugger if session[:debug_on]
            existing_request = TransmissionDate.find_by_sql('select id from transmission_dates where node_id = '+node_id.to_s+' and request_no = '+request_no.to_s+' and split_no = '+split_no.to_s).first
            next if existing_request
            new_request = TransmissionDate.new
            new_request.node_id = node_id.to_i
            new_request.Active_Node_Owner = active_node_owner
            new_request.Invoice_Party = active_node_owner
            new_request.Work_Type = work_type
            new_request.date_raised = date_raised
            new_request.date_required_by = date_required_by
            new_request.Existing_Capacity = existing_capacity
            new_request.Required_Capacity = required_capacity
            new_request.link_technology_id = technology['id']
            new_request.Request_No = request_no.to_i
            new_request.Split_No = split_no
            new_request.S7_Baseline = Date.strptime(s7_baseline, '%d/%m/%Y') unless s7_baseline.blank?
            new_request.S7_Forecast = Date.strptime(s7_forecast, '%d/%m/%Y') unless s7_forecast.blank?
            new_request.S7_Actual = Date.strptime(s7_actual, '%d/%m/%Y') unless s7_actual.blank?
            new_request.S8_Baseline = Date.strptime(s8_baseline, '%d/%m/%Y') unless s8_baseline.blank?
            new_request.S8_Forecast = Date.strptime(s8_forecast, '%d/%m/%Y') unless s8_forecast.blank?
            new_request.S8_Actual = Date.strptime(s8_actual, '%d/%m/%Y') unless s8_actual.blank?
            new_request.C1 = Date.strptime(c1, '%d/%m/%Y') unless c1.blank?
            new_request.C2 = Date.strptime(c2, '%d/%m/%Y') unless c2.blank?
            new_request.C3 = Date.strptime(c3, '%d/%m/%Y') unless c3.blank?
            new_request.C4 = Date.strptime(c4, '%d/%m/%Y') unless c4.blank?
            new_request.Remarks = comments
            new_request.save!
          end

        end # end node has been split

      else # build as split
        if work_type == "Node Split"
          # Splitting a node on a built as split Joint Site
          debugger if session[:debug_on]
          existing_request = TransmissionDate.find_by_sql('select id from transmission_dates where node_id = '+node_id.to_s+' and request_no = '+request_no.to_s+' and split_no = '+split_no.to_s).first
          next if existing_request ### will do updates eventually
          unless existing_capacity == 0
            new_request = TransmissionDate.new
            new_request.node_id = node_id.to_i
            new_request.Work_Type = work_type
            new_request.Active_Node_Owner = active_node_owner
            new_request.Invoice_Party = active_node_owner
            new_request.date_raised = date_raised
            new_request.date_required_by = date_required_by
            new_request.Existing_Capacity = existing_capacity
            new_request.Required_Capacity = 0
            new_request.link_technology_id = technology['id']
            new_request.Request_No = request_no.to_i
            new_request.Split_No = split_no
            new_request.S7_Baseline = Date.strptime(s7_baseline, '%d/%m/%Y') unless s7_baseline.blank?
            new_request.S7_Forecast = Date.strptime(s7_forecast, '%d/%m/%Y') unless s7_forecast.blank?
            new_request.S7_Actual = Date.strptime(s7_actual, '%d/%m/%Y') unless s7_actual.blank?
            new_request.S8_Baseline = Date.strptime(s8_baseline, '%d/%m/%Y') unless s8_baseline.blank?
            new_request.S8_Forecast = Date.strptime(s8_forecast, '%d/%m/%Y') unless s8_forecast.blank?
            new_request.S8_Actual = Date.strptime(s8_actual, '%d/%m/%Y') unless s8_actual.blank?
            new_request.C1 = Date.strptime(c1, '%d/%m/%Y') unless c1.blank?
            new_request.C2 = Date.strptime(c2, '%d/%m/%Y') unless c2.blank?
            new_request.C3 = Date.strptime(c3, '%d/%m/%Y') unless c3.blank?
            new_request.C4 = Date.strptime(c4, '%d/%m/%Y') unless c4.blank?
            new_request.Remarks = comments
            new_request.save!

            next_request = TransmissionDate.new(new_request.attributes)
            next_request.Existing_Capacity = 0
            next_request.Required_Capacity = required_capacity
            next_request.Request_No = request_no.to_i + 0.1
            next_request.Active_Node_Owner = active_node_owner
            next_request.Invoice_Party = active_node_owner
            next_request.save!
          else ### second part of split request
            new_request = TransmissionDate.new
            new_request.node_id = node_id.to_i
            new_request.Active_Node_Owner = active_node_owner
            new_request.Invoice_Party = active_node_owner
            new_request.Work_Type = work_type
            new_request.date_raised = date_raised
            new_request.date_required_by = date_required_by
            new_request.Existing_Capacity = existing_capacity
            new_request.Required_Capacity = required_capacity
            new_request.link_technology_id = technology['id']
            new_request.Split_No = split_no
            new_request.Request_No = request_no.to_i
            new_request.S7_Baseline = Date.strptime(s7_baseline, '%d/%m/%Y') unless s7_baseline.blank?
            new_request.S7_Forecast = Date.strptime(s7_forecast, '%d/%m/%Y') unless s7_forecast.blank?
            new_request.S7_Actual = Date.strptime(s7_actual, '%d/%m/%Y') unless s7_actual.blank?
            new_request.S8_Baseline = Date.strptime(s8_baseline, '%d/%m/%Y') unless s8_baseline.blank?
            new_request.S8_Forecast = Date.strptime(s8_forecast, '%d/%m/%Y') unless s8_forecast.blank?
            new_request.S8_Actual = Date.strptime(s8_actual, '%d/%m/%Y') unless s8_actual.blank?
            new_request.C1 = Date.strptime(c1, '%d/%m/%Y') unless c1.blank?
            new_request.C2 = Date.strptime(c2, '%d/%m/%Y') unless c2.blank?
            new_request.C3 = Date.strptime(c3, '%d/%m/%Y') unless c3.blank?
            new_request.C4 = Date.strptime(c4, '%d/%m/%Y') unless c4.blank?
            new_request.Remarks = comments
            new_request.save!
          end

        else
          # work type is initial or upgrade
          debugger if session[:debug_on]
          existing_request = TransmissionDate.find_by_sql('select id from transmission_dates where node_id = '+node_id.to_s+' and request_no = '+request_no.to_s+' and split_no = '+split_no.to_s).first
          next if existing_request
          new_request = TransmissionDate.new
          new_request.node_id = node_id.to_i
          new_request.Active_Node_Owner = active_node_owner
          new_request.Invoice_Party = active_node_owner
          new_request.Work_Type = work_type
          new_request.date_raised = date_raised
          new_request.date_required_by = date_required_by
          new_request.Existing_Capacity = existing_capacity
          new_request.Required_Capacity = required_capacity
          new_request.link_technology_id = technology['id']
          new_request.Request_No = request_no.to_i
          new_request.Split_No = split_no
          new_request.S7_Baseline = Date.strptime(s7_baseline, '%d/%m/%Y') unless s7_baseline.blank?
          new_request.S7_Forecast = Date.strptime(s7_forecast, '%d/%m/%Y') unless s7_forecast.blank?
          new_request.S7_Actual = Date.strptime(s7_actual, '%d/%m/%Y') unless s7_actual.blank?
          new_request.S8_Baseline = Date.strptime(s8_baseline, '%d/%m/%Y') unless s8_baseline.blank?
          new_request.S8_Forecast = Date.strptime(s8_forecast, '%d/%m/%Y') unless s8_forecast.blank?
          new_request.S8_Actual = Date.strptime(s8_actual, '%d/%m/%Y') unless s8_actual.blank?
          new_request.C1 = Date.strptime(c1, '%d/%m/%Y') unless c1.blank?
          new_request.C2 = Date.strptime(c2, '%d/%m/%Y') unless c2.blank?
          new_request.C3 = Date.strptime(c3, '%d/%m/%Y') unless c3.blank?
          new_request.C4 = Date.strptime(c4, '%d/%m/%Y') unless c4.blank?
          new_request.Remarks = comments
          new_request.save!
        end

      end # end built as split

    end # end file.each line

  end

# end import tx data
end
