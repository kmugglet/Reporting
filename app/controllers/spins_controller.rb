class SpinsController < ApplicationController

  require 'csv'

  def index
    session[:root_dir]='/home/keith/Reporting/'

    @spins = Spin.paginate :page => params[:page], :order => 'id DESC'
  end

  def edit
    session[:debug_on] = false
    debugger if session[:debug_on]

    if params[:form_referrer] == "show_spin"
      spin_id = params[:spin][:id]
    else
      spin_id = params[:id]
    end
    @spin = Spin.find(spin_id)

    @documents = @spin.documents

    @documents.each do |d|
      d.uploaded = true
      d.save
    end
    @spin_sites = VSpinSiteNodeCell.find_by_sql('select distinct site_id from v_spin_site_node_cells where id = '+spin_id.to_s)

    @categories = Tracking.all(:order => :id)
  end

  def new
    session[:root_dir]='/home/keith/Reporting/'
    @spin = Spin.new
    attachment = @spin.documents.build
  end

  def create_spin
    session[:debug_on]=true
    debugger if session[:debug_on]
    session[:document_error_message] = Array.new


    @spin = Spin.new(params[:spin])
    print session
    if @spin.reason_id = 1
      @spin.approval_id = 3 # offer for new site
    end
    tmp_spin_number = Spin.find(:last).id.to_i + 1
    @spin.id = tmp_spin_number
    tmp_spin_number = "000000"+tmp_spin_number.to_s
    @spin.spinnumber = "SPIN"+tmp_spin_number[-6..-1].to_s
    @spin.tracking_id = 1 ## new spin category
    @spin.date_raised = Date.today
    @user = User.find(params[:spin][:initiator])
    @spin.user_id = params[:spin][:initiator]
    @spin.initiator = @user.full_name
    @spin.phone = @user.phone
    @spin.email = @user.email
    @spin.operator = @user.company
    @spin.save!
    redirect_to :action => "edit", :id => tmp_spin_number.to_i
  end

  def update
    session[:debug_on] = false
    session[:document_error_message] = Array.new

    debugger if session[:debug_on]
    @spin = Spin.find(params[:id])
    if @spin.update_attributes(params[:spin])
      if params[:spin][:documents_attributes]
        @document = @spin.documents.last
        read_documents(@document)
      end
      debugger if session[:debug_on]
      if session[:document_error_message].empty?
        flash[:notice] = 'Spin was successfully updated.'
      else
        error_message = ''
        session[:document_error_message].each do |err|
          error_message += err + '\n'
        end
        flash[:error] = error_message
      end
      #redirect_to :action => "edit", :id => params[:id] if flash[:error]; return
    end
    #@spin.documents.all.uploaded = true;
    @spin.approval_id = 3 # New site offer to other operator
    unless @spin.sites.empty?
      site = @spin.sites.first
      if site.build_responsibility == @spin.operator and @spin.reason_id = 2
        @spin.approval_id =1 # lead operator working on existing own site
      end
      if site.build_responsibility != @spin.operator and @spin.reason_id = 2
        @spin.approval_id =2 # other operator working on existing site
      end
    end
    @spin.save
    @document = @spin.documents.last
    @document.destroy unless @document.blank? ### can't figure out why it saves the document twice! so just delete the last one added to the spin :-P
  end

  def read_documents(uploaded_file)
    session[:debug_on] = true
    debugger if session[:debug_on]
    uploaded_file.uploaded = true
    uploaded_file.comments = 'Spin Data'
    uploaded_file.user_id = session[:user_id]
=begin

    To reload the uploaded file so we can parse it, we need to rebuild the full file path where it is stored
    these paths are relative to the rails app root (in this case /home/keith/Reporting)

=end

    root_dir = session[:root_dir]
    filename = uploaded_file.filename
    doc_id = uploaded_file.id
    spin_id = uploaded_file.spin_id
    doc_id = "00000000" + doc_id.to_s
    doc_id = doc_id[-9..-1]
    base_dir = root_dir + 'public/documents/'
    base_dir = base_dir + doc_id[1..4] + '/' + doc_id[5..8] + '/'
    stored_filename = base_dir + filename
    extension = filename[-6..-1]
    start_pos = extension.index('.')
    extension = extension[start_pos..20]
    new_site_created = new_node_created = new_cell_created = false
    same_site_name = same_node_number = nil
    new_site = new_node = nil
    row_number = 0
    spinnumber = 'tmpSpinFile'+uploaded_file.spin_id.to_s+'.csv'
=begin

    because the ruby spreadsheet gem doesn't do what I needed, I'm passing the file to a perl script which converts to csv
    and then saves to a temporary file

=end
    command_line = "perl #{root_dir}bin/read_spreadsheet.pl "+stored_filename+" #{root_dir}bin/"+spinnumber+" 'Additional Info'"
    print command_line
    system command_line
    csv_filename = "#{root_dir}bin/#{spinnumber}"
    file = File.new(csv_filename, 'r')
    count = `wc -l < #{csv_filename}`
    fail "wc failed: #{$?}" if $? != 0
    count.chomp!


    file.each_line("\n") do |row|
      column = row.split(";")

      debugger if session[:debug_on]
      row_number+=1
      puts '----------------------------------------------------- start new row ----------------------------------------------------' if session[:debug_on]
      blank_row = true


=begin
      ignore the top row containing the headers
      might read them in one day in case a sheet is missing columns
=end
      print "#{row_number}/#{count}"

      if row_number > 1
        debugger if session[:debug_on]
        for column_id in (0...31)
          print 'column [', column_id, '] : ', column[column_id] if session[:debug_on]
          puts "" if session[:debug_on]
          blank_row = false unless column[column_id].blank?
        end

        break if blank_row
        document_error_messages = false
        debugger if session[:debug_on]
        jv_id = column[0]
        unless Site.first(:conditions => ['jv_site = ?', jv_id])
          jv_id = nil
        end
        if jv_id == nil
          Site.first(:conditions => ['optus_site = ?', column[5]]) unless column[5].blank?
        end
        if jv_id == nil
          Site.first(:conditions => ['vodafone_site = ?', column[6]]) unless column[6].blank?
        end
        if column[1]
          site_name = column[1]
        else
          session[:document_error_message] << 'No site name. Row'+(row_number -1).to_s if jv_id == nil
        end
        node_number = column[26].to_i
        if column[3]
          state = column[3]
        else
          session[:document_error_message] << 'No State abbr. Row'+(row_number -1).to_s if jv_id == nil
        end
        if column[4]
          area = column[4]
        else
          session[:document_error_message] << 'No MORAN/Inner Area info. Row'+(row_number -1).to_s if jv_id == nil
        end

        rnc = column[9]
        puts rnc, rnc.blank? if session[:debug_on]
=begin
        check if rnc number given otherwise lookup number from name
=end
        unless RncName.first(:conditions => ['rnc_number = ?', rnc.to_s])
          find_rnc = RncName.first(:conditions => ['rnc_name like ?', rnc.to_s]) unless column[9].blank?
          rnc = find_rnc.rnc_number unless find_rnc.blank?
        else
          find_rnc = RncName.first(:conditions => ['rnc_number = ?', rnc.to_s])
          rnc = 'UNKNOWN' if find_rnc.blank?
          rnc = find_rnc.rnc_number unless find_rnc.blank?
        end
        puts rnc, rnc.blank? if session[:debug_on]

        wbts = column[14]
        area = "MOR" if area == nil
=begin
        its quicker than a db lookup !!
=end
        case state.downcase
          when 'nsw'
            state_id = 2
          when 'qld'
            state_id = 6
          when 'sa'
            state_id = 3
          when 'vic'
            state_id = 4
          when 'wa'
            state_id = 7
          else
            state_id = 2
        end
        area = area.capitalize
        case area
          when 'Inner'
            area_id = 2
          else
            area_id = 1
        end

        node_owner = column[13]
        puts node_owner
        dont_save_cell = false


        puts 'Check if new site / node' if session[:debug_on]
        print 'name ', site_name, ' : same_name ', same_site_name, ' : number ', node_number, '  : same_number ', same_node_number, ' : node_number_imported ', column[26] if session[:debug_on]
        puts "" if session[:debug_on]
        if site_name != same_site_name
          new_site_created = new_node_created = new_cell_created = false
          puts 'site <> same_site_name' if session[:debug_on]
        elsif node_number != same_node_number and site_name == same_site_name
          new_node_created = new_cell_created = false
          puts 'site == same_site_name and node_number <> same_node_number' if session[:debug_on]
        end
        puts 'Check site logic' if session[:debug_on]
        print 'jv_id ', jv_id, ' : site created ', new_site_created, ' : node_created ', new_node_created if session[:debug_on]
        puts "" if session[:debug_on]
        print 'new_site ', new_site, ': new_node ', new_node if session[:debug_on]
        puts "" if session[:debug_on]
        debugger if session[:debug_on]
        if jv_id==nil and new_site_created==false and new_node_created==false ### brand new site
          puts 'create_spin new site' if session[:debug_on]
          new_site = Site.new
          new_jv_id = new_jvid(state)
          new_site.jv_site = new_jv_id
          new_site.spin_id = spin_id

          new_node = new_site.nodes.build
          new_node.spin_id = spin_id
          new_node.node_number = 1
          wbts = new_wbts(state_id, new_site.jv_site, node_owner, node_number) if wbts.blank?
          new_node.wbts = wbts
          new_site_created = new_node_created = true
        elsif jv_id==nil and new_site_created==true and new_node_created==false ## new node on new site just created for this spin
          puts 'create_spin new node' if session[:debug_on]
          new_node = new_site.nodes.build
          new_node.spin_id = spin_id
          node_number = Node.find_by_sql('select node_number from nodes where site_id = "'+new_site['id'].to_s+'"').count
          node_number += 1
          new_node.node_number = node_number
          wbts = new_wbts(state_id, new_site.jv_site, node_owner, node_number) if wbts.blank?
          new_node.wbts = wbts

          new_node_created = true
        elsif jv_id!=nil #### update existing site/node
          puts 'update existing site' if session[:debug_on]
          new_site = Site.first(:conditions => ['jv_site = ?', jv_id])
          site_id = new_site['id']
          old_site = Site.new
          old_site = Site.new(new_site.attributes) unless new_site.blank?
          old_site.historical = true
          old_site.updated_at = Time.now
          old_site.spin_id = spin_id
          old_site.save!
          new_node = Node.first(:conditions => ['node_number = ? and site_id = ?', node_number, site_id])
          new_node = Node.first(:conditions => ['wbts = ? and site_id = ?', wbts.to_s, site_id]) if new_node.blank?

          new_node_created = 'existing'
          if new_node.blank?
            puts 'add new node to existing site' if session[:debug_on]
            new_node = new_site.nodes.build
            new_node_created = true
            new_node.spin_id = spin_id
            new_node.site_id = site_id if site_id
            unless column[26].blank?
              node_number = column[26].to_i
            else
              node_number = Node.find_by_sql('select 1 from nodes where site_id = "'+new_site['id'].to_s+'"').count if node_number.blank?
              node_number += 1
            end
            new_node.node_number = node_number
            wbts = new_wbts(state_id, new_site.jv_site, node_owner, node_number) if wbts.blank?
            new_node.wbts = wbts
            new_node.rnc = rnc
            new_node.save!
            new_node_created = true

          end

          new_site_created = 'existing'
        end
        node_id = new_node['id']
        debugger if session[:debug_on]
        new_cell = Cell.first(:conditions => ['cellid = ? and node_id = ?', column[29].to_i, node_id]) if (column[29] != 99999 and !column[29].blank?)
        new_cell = new_node.cells.build if new_cell.blank?
        new_cell.cellid = column[29].to_i unless column[29].blank?
        uarfcn_id = UARFCN.first(:conditions => ['freq = ?', column[30].to_i.to_s])


        #### Take the fact that there is no UARFCN to mean only update details, don't create new cell
        dont_save_cell = true if uarfcn_id.blank?

        new_cell.UARFCN_id = uarfcn_id['id'] unless uarfcn_id.blank?
        new_cell.node_id = node_id unless new_cell.node_id
        new_site.name = site_name unless site_name.blank?
        new_site.state_id = state_id unless state_id.blank?
        new_site.area_id = area_id unless area_id.blank?

        site_source_id = SiteSourceProgram.first(:conditions => ['source = ?', column[17].to_s])
        unless site_source_id.blank?
          source_id = site_source_id['ID']
        else
          source_id = 40
        end
        new_site.site_source_program_id = source_id
        new_node.source_id = source_id
        pre_build_id = PreBuildStatus.first(:conditions => ['pre_spinoza_site_status = ?', column[10].to_s])
        if pre_build_id.blank?
          pre_build_id = 10
        else
          pre_build_id = pre_build_id['id']
        end
        new_site.pre_build_status_id = pre_build_id
        new_node.rnc = rnc
        new_site.latitude_dll = column[7] unless column[7].blank?
        new_site.longitude_dll = column[8] unless column[8].blank?
        new_site.optus_site = column[5].to_s unless column[5].blank?
        new_site.vodafone_site = column[6].to_s unless column[6].blank?
        macro_type_id = MacroType.first(:conditions => ['name = ?', column[11]])
        unless macro_type_id.blank?
          new_site.macro_type_id = macro_type_id['id']
        else
          new_site.macro_type_id = 6 if new_site.macro_type_id.blank?
        end
        new_site.build_responsibility = column[12] unless column[12].blank?
        new_node.node_owner = new_site.build_responsibility
        new_cell.cell_operator = column[27] unless column[27].blank?
        if new_cell.cell_operator.blank?
          new_cell.cell_operator = node_owner[0..0]
        end
        new_cell.cell_number = column[28]
        if new_cell.cell_number.blank?
          cell_number = Cell.find_by_sql('select 1 from cells where node_id = "'+new_node['id'].to_s+'"').count
          cell_number+=1
          new_cell.cell_number = cell_number
        end
        new_cell.spin_id = spin_id
        new_site.address = column[25] if new_site.address.blank?
        replacing_site = column[18]
        replacing_site_id = Site.first(:conditions => ['jv_site = ?', replacing_site]).id unless replacing_site.blank?
        if replacing_site_id
          repl = Site.find(replacing_site_id)
          unless repl.empty?
            repl.replaced_by = site_id
            repl.removed_from_msl = true
            repl.replaced_at = Date.today
            repl.save
          end
        end
        unless node_owner.blank?
          new_node.node_owner = node_owner unless new_node.node_owner
        end
        node_type_id = NodeType.first(:conditions => ['name = ?', column[23]]).id unless column[23].blank?
        node_type_id = 3
        new_node.node_type_id = node_type_id if new_node.node_type_id.blank?
        new_node.node_number = node_number if new_node.node_number.blank?
        site_status_id = Status.first(:conditions => ['name = ?', column[19]]).id unless column[19].blank?
        site_status_id = 1 if site_status_id.blank?
        new_site.status_id = site_status_id if new_site.status_id.blank?
        new_node.status_id = site_status_id if new_node.status_id.blank?
        new_cell.status_id = site_status_id if new_cell.status_id.blank?
        if session[:document_error_message].empty?
          new_site.save!
          new_node.save!
          new_cell.save! unless dont_save_cell
          session[:new_data] = true
        end
        same_site_name = site_name
        same_node_number = node_number
      end
    end

    command_line = 'rm bin/'+spinnumber
    system command_line

  end

  def new_jvid(state_name)
    debugger if session[:debug_on]
    case state_name
      when 'NSW'
        prefix = 'JS'
      when 'ACT'
        prefix = 'JS'
      when 'QLD'
        prefix = 'JB'
      when 'VIC'
        prefix = 'JM'
      when 'WA'
        prefix = 'JP'
      when 'SA'
        prefix = 'JA'
      else
        session[:document_error_message] << "No state supplied for new_jvid"
        return
    end
    already_exists = false
    if session[:document_error_message].empty?
      for site_id in (9001..9999)
        check_id = prefix + site_id.to_s
        already_exists = !Site.all(:conditions => ['jv_site = ?', check_id]).blank?
        break unless already_exists
      end
      if already_exists
        for site_id in (6000..7999)
          check_id = prefix + site_id.to_s
          already_exists = !Site.all(:conditions => ['jv_site = ?', check_id]).blank?
          break unless already_exists
        end
      end
      if already_exists
        for site_id in (1000..5999) ### just in case!!!!
          check_id = prefix + site_id.to_s
          already_exists = !Site.all(:conditions => ['jv_site = ?', check_id]).blank?
          break unless already_exists
        end
      end
    end
    check_id
  end

  def new_wbts(state_id, jv_id, node_owner, node_number)
    debugger if session[:debug_on]

    already_exists = false
    site_number = jv_id[-4..-1]
    for wbts_id in (0..4)
      check_id = wbts_id.to_s + site_number.to_s
      check_id = check_id.to_i
      already_exists = !Node.all(:conditions => ['wbts = ?', check_id]).blank?
      break unless already_exists
    end
    if already_exists
      # would be true if completed previous loop all the way through
      # if we get to here all wbts IDs matching JV Site ID are used, so find the first unused WBTS ID
      for wbts_id in (2000..49999)
        check_id = check_id.to_i
        already_exists = !Node.all(:conditions => ['wbts = ?', check_id]).blank?
        break unless already_exists
      end
    end

    check_id

  end

  def old_wbts(state_id, jv_id, node_owner, node_number)

  end


  def show_site
    @spin = Site.first(params[:id])
  end

  def lead
    debugger if session[:debug_on]
    @spin = Spin.find(params[:id])
    update
    @spin.update_attributes(params[:spin])

    if @spin.operator == "Optus" and @spin.optus_final.blank?
      print "Optus lead final" if session[:debug_on]
      @spin.optus_final = Date.today
    elsif @spin.operator == "Vodafone" and @spin.vha_final.blank?
      print "VHA lead final" if session[:debug_on]
      @spin.vha_final = Date.today
    end

    if session[:new_data]
      debugger if session[:debug_on]
      @spin.tracking_id = 2
      if @spin.approval_id = 1
        @spin.tracking_id = 3
      end
    end
    params[:spin][:documents_attributes] = []
    @spin.save
    @document = @spin.documents.last
    @document.destroy unless @document.blank? ### can't figure out why it saves the document twice! so just delete the last one added to the spin :-P

    redirect_to :action => "edit", :id => params[:id]
  end

  def other
    debugger if session[:debug_on]
    @spin = Spin.find(params[:id])
    params[:spin][:documents_attributes] = []
    #update
    @spin.update_attributes(params[:spin])

    if @spin.operator == "Vodafone" and @spin.optus_final.blank?
      print "Optus lead final" if session[:debug_on]
      @spin.optus_final = Date.today
    elsif @spin.operator == "Optus" and @spin.vha_final.blank?
      print "VHA lead final" if session[:debug_on]
      @spin.vha_final = Date.today
    end
    @spin.tracking_id = 3
    params[:spin][:documents_attributes] = []
    @spin.save!
    @document = @spin.documents.last
    @document.destroy unless @document.blank? ### can't figure out why it saves the document twice! so just delete the last one added to the spin :-P
    redirect_to :action => "edit", :id => params[:id]
  end

  def jvo
    debugger if session[:debug_on]
    @spin = Spin.find(params[:id])
    params[:spin][:documents_attributes] = []
    #update
    @spin.update_attributes(params[:spin])

    if @spin.jvo_final.blank?
      @spin.jvo_final = Date.today
    end
    @spin.tracking_id = 4
    params[:spin][:documents_attributes] = []
    @spin.save!
    @document = @spin.documents.last
    @document.destroy unless @document.blank? ### can't figure out why it saves the document twice! so just delete the last one added to the spin :-P
    redirect_to :action => "edit", :id => params[:id]
  end

  def add_to_msl
    @spin = Spin.find(params[:id])
    @sites = @spin.sites.all
    @sites.each do |s|
      if s.status_id == 1
        s.status_id = 2
        s.save
      end
      @nodes = s.nodes.all
      @nodes.each do |n|
        if n.status_id == 1
          n.status_id = 2
          n.save
        end
        @cells = n.cells.all
        @cells.each do |c|
          if c.status_id == 1
            c.status_id = 2
            c.save
          end

        end
      end
    end
    @spin.tracking_id = 5
    params[:spin][:documents_attributes] = []
    @spin.save
    @document = @spin.documents.last
    @document.destroy unless @document.blank? ### can't figure out why it saves the document twice! so just delete the last one added to the spin :-P
    redirect_to :action => "edit", :id => params[:id]

  end

  def closed
    debugger if session[:debug_on]
    @spin = Spin.find(params[:id])
    update
    @spin.update_attributes(params[:spin])

    if @spin.date_closed.blank?
      @spin.date_closed = Date.today
    end
    @spin.tracking_id = 6
    params[:spin][:documents_attributes] = []
    @spin.save!
    @document = @spin.documents.last
    @document.destroy unless @document.blank? ### can't figure out why it saves the document twice! so just delete the last one added to the spin :-P
    redirect_to :action => "edit", :id => params[:id]
  end

  def cancel
    debugger if session[:debug_on]
    @spin = Spin.find(params[:id])
  end

  def cancel_spin
    @spin = Spin.find(params[:id])
    @spin.update_attributes(params[:spin])
    @spin.date_closed = Date.today
    params[:spin][:documents_attributes] = []
    @spin.save!
    @document = @spin.documents.last
    @document.destroy unless @document.blank? ### can't figure out why it saves the document twice! so just delete the last one added to the spin :-P
    redirect_to :action => "index"
  end

  def show
    @spin = Spin.find(params[:id])
    @spin_sites = VSpinSiteNodeCell.find_by_sql('select distinct site_id from v_spin_site_node_cells where id = '+params[:id])
  end

end
