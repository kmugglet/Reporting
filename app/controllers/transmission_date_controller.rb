class TransmissionDateController < ApplicationController

  auto_complete_for :site, :jv_site, :limit => 20

  def index
    @transmission_dates = TransmissionDate.all(:order => "id desc")
    @sites = Site.find_by_sql("select distinct n.site_id, s.jv_site, s.name from nodes n, transmission_dates t, sites s where t.node_id = n.id and n.site_id = s.id").paginate :page => params[:page];
  end

  def show
    #debugger
    if params[:form_referrer] == "show_site"
      @tmp_site = Site.first(:conditions => ['jv_site = ?', params[:site][:jv_site]])
    else
      @tmp_site = Site.find(params[:id])
    end
    tmp_site_id = @tmp_site['id'].to_s
    @transmission_dates = TransmissionDate.find_by_sql("select t.* from transmission_dates t, nodes n, sites s where s.id = n.site_id and t.node_id = n.id and s.id = '"+tmp_site_id+"' order by t.Request_No")
    @split = TransmissionDate.find_by_sql("select v.id from v_no_transmission v, sites s where v.site_id = s.id and s.id = '"+tmp_site_id+"' limit 1")
    @site = @tmp_site
  end

  def add_request
    @request = TransmissionDate.find(params[:id])
    @link_technologies = LinkTechnology.all
    tmp_site_id = @request.node.site_id
    @req_num = TransmissionDate.find_by_sql("select max(Request_No) as request_no from transmission_dates, nodes where nodes.id = transmission_dates.node_id and nodes.site_id = " + tmp_site_id.to_s)
    @new_request = @request
    @new_request.Existing_Capacity = @request.Required_Capacity
    @new_request.Active_Node_Owner = @request.Active_Node_Owner

    @new_request.date_raised = (Date.today)
    @new_request.date_required_by = nil
    @new_request.S7_Forecast = nil
    @new_request.S8_Forecast = nil
    @new_request.S7_Actual = nil
    @new_request.S8_Actual = nil

    @jv_site = Site.find(@new_request.node.site_id)

  end

  def build_initial
    @jv_site = Site.find(params[:id])
    @new_request = TransmissionDate.new
    @nodes = @jv_site.nodes.all
  end

  def save_initial
    @nr = TransmissionDate.new
    print params[:transmission_date]
    @nr.attributes = params[:transmission_date]
    @nr.Work_Type = 'Initial'
    node_id = @nr.node_id
    @node = Node.find(node_id)
    node_owner = @node.node_owner
    @nr.Active_Node_Owner = node_owner
    @nr.Invoice_Party = node_owner
    @nr.Existing_Capacity = 0
    @nr.Request_No = @node.node_number
    @nr.node_id = node_id
    @nr.save!
    redirect_to :action => "index"
  end

  def del_request
    @request= TransmissionDate.find(params[:id])
    tmp_site_id = @request.node.site_id
    @request.destroy
    redirect_to :action => "show", :id => tmp_site_id
  end

  def update_request
    @request = TransmissionDate.find(params[:id])
    @jv_site = Site.find(@request.node.site_id)
  end

  def save_request
    case params[:commit]
      when "Upgrade ATM"
        #debugger                S
        # upgrade ATM
        @nr = TransmissionDate.new
        print params[:transmission_date]
        @nr.attributes = params[:transmission_date]
        @nr.date_raised = mydate(params[:transmission_date][:date_raised])
        @nr.date_required_by = mydate(params[:transmission_date][:date_required_by])
        @nr.S7_Forecast = mydate(params[:transmission_date][:S7_Forecast])
        @nr.S8_Forecast = mydate(params[:transmission_date][:S8_Forecast])
        @nr.S7_Actual = mydate(params[:transmission_date][:S7_Actual])
        @nr.S8_Actual = mydate(params[:transmission_date][:S8_Actual])
        @nr.Request_No = params[:last_request].to_i + 1
        @nr.Work_Type = 'Upgrade'
        @nr.link_technology_id = '2' ## 2 - ATM, 1 - IP
        @nr.save
      when "Upgrade IP"
        # upgrade_ip
        @nr = TransmissionDate.new
        print params[:transmission_date]
        tmp_request_no = params[:last_request].to_i
        @nr.attributes = params[:transmission_date]
        @nr.date_raised = mydate(params[:transmission_date][:date_raised])
        @nr.date_required_by = mydate(params[:transmission_date][:date_required_by])
        @nr.S7_Forecast = mydate(params[:transmission_date][:S7_Forecast])
        @nr.S8_Forecast = mydate(params[:transmission_date][:S8_Forecast])
        @nr.S7_Actual = mydate(params[:transmission_date][:S7_Actual])
        @nr.S8_Actual = mydate(params[:transmission_date][:S8_Actual])
        @nr.Work_Type = 'Upgrade'

        tmp_link_tech = @nr.link_technology_id
        if tmp_link_tech == 2 then
          ## upgrading from ATM to IP - add relevant steps -- take ATM down to 0 first
          tmp_required_capacity = @nr.Required_Capacity
          @nr.Required_Capacity = 0
          @tmp_operator = Operator.first(:conditions => ["name = ?", @nr.Active_Node_Owner])
          @nr.Request_No = tmp_request_no + 1 # increment the request_no for the ATM step
          @new_ip = TransmissionDate.new
          @new_ip.Work_Type = "Upgrade"
          @new_ip.attributes = params[:transmission_date]
          @new_ip.Existing_Capacity = 0
          @new_ip.Required_Capacity = tmp_required_capacity
          @new_ip.Request_No = tmp_request_no + 2 # increment the request_no for the IPstep
          @new_ip.operator_id = @tmp_operator.id
          @new_ip.date_raised = mydate(params[:transmission_date][:date_raised])
          @new_ip.date_required_by = mydate(params[:transmission_date][:date_required_by])
          @new_ip.S7_Forecast = mydate(params[:transmission_date][:S7_Forecast])
          @new_ip.S8_Forecast = mydate(params[:transmission_date][:S8_Forecast])
          @new_ip.S7_Actual = mydate(params[:transmission_date][:S7_Actual])
          @new_ip.S8_Actual = mydate(params[:transmission_date][:S8_Actual])
          @new_ip.link_technology_id = "1" ## 2 - ATM, 1 - IP
          @new_ip.save
        else
          @nr.Request_No = tmp_request_no + 1
        end

        @nr.save

      when "Save Update"
        @nr = TransmissionDate.find(params[:id])
        print params[:transmission_date]
        @nr.attributes = params[:transmission_date]
        @nr.date_raised = mydate(params[:transmission_date][:date_raised])
        @nr.date_required_by = mydate(params[:transmission_date][:date_required_by])
        @nr.S7_Forecast = mydate(params[:transmission_date][:S7_Forecast])
        @nr.S8_Forecast = mydate(params[:transmission_date][:S8_Forecast])
        @nr.S7_Actual = mydate(params[:transmission_date][:S7_Actual])
        @nr.S8_Actual = mydate(params[:transmission_date][:S8_Actual])
        @nr.save
    end
    redirect_to :action => "show", :id => @nr.node.site_id
  end

  def split_site
#    debugger

    @last_request = TransmissionDate.find(params[:id])
    @new_request = TransmissionDate.new
    tmp_site_id = @last_request.node.site_id
    tmp_node_id = @last_request.node_id
    @req_num = TransmissionDate.find_by_sql("select max(Request_No) as request_no from transmission_dates, nodes, v_transmission_requests_chargable where nodes.id = transmission_dates.node_id and transmission_dates.id = v_transmission_requests_chargable.id and nodes.site_id = #{tmp_site_id.to_s}")
    @last_chargable = TransmissionDate.first(:conditions => ['node_id = ? and request_no = ?', tmp_node_id.to_s, @req_num[0]['request_no'].to_s])
    @req_num = TransmissionDate.find_by_sql("select max(Request_No) as request_no from transmission_dates, nodes where nodes.id = transmission_dates.node_id and nodes.site_id = #{tmp_site_id.to_s}")
    tmp_id = @new_request.id
    @new_request = @last_request
    @new_request.id = tmp_id
    @new_request.Existing_Capacity = @last_chargable.Required_Capacity
#    @new_request.Active_Node_Owner = @last_request.node.site.build_responsibility

    @new_request.date_raised = (Date.today)
    @new_request.S7_Forecast = nil
    @new_request.S8_Forecast = nil
    @new_request.S7_Actual = nil
    @new_request.S8_Actual = nil

    @site = Site.find(@new_request.node.site_id)
    @split = TransmissionDate.find_by_sql("select id from v_no_transmission where site_id = "+@site.id.to_s+" limit 1")
  end

  def save_split
    debugger
    case params[:commit]
      when "Split Site"
        debugger
        # split_site
        @original_node = TransmissionDate.new
        @lead = TransmissionDate.new
        @other = TransmissionDate.new
        print params[:transmission_date]
        tmp_request_no = params[:last_request].to_i
        @original_node.attributes = params[:transmission_date]
        @original_node.date_raised = mydate(params[:transmission_date][:date_raised])
        @original_node.date_required_by = mydate(params[:transmission_date][:date_required_by])
        @original_node.S7_Forecast = mydate(params[:transmission_date][:S7_Forecast])
        @original_node.S8_Forecast = mydate(params[:transmission_date][:S8_Forecast])
        @original_node.S7_Actual = mydate(params[:transmission_date][:S7_Actual])
        @original_node.S8_Actual = mydate(params[:transmission_date][:S8_Actual])
        @original_node.Work_Type = 'Node Split'
        @lead.attributes = params[:transmission_date]
        @lead.date_raised = mydate(params[:transmission_date][:date_raised])
        @lead.date_required_by = mydate(params[:transmission_date][:date_required_by])
        @lead.S7_Forecast = mydate(params[:transmission_date][:S7_Forecast])
        @lead.S8_Forecast = mydate(params[:transmission_date][:S8_Forecast])
        @lead.S7_Actual = mydate(params[:transmission_date][:S7_Actual])
        @lead.S8_Actual = mydate(params[:transmission_date][:S8_Actual])
        @lead.Work_Type = 'Node Split'
        @other.attributes = params[:transmission_date]
        @other.date_raised = mydate(params[:transmission_date][:date_raised])
        @other.date_required_by = mydate(params[:transmission_date][:date_required_by])
        @other.S7_Forecast = mydate(params[:transmission_date][:S7_Forecast])
        @other.S8_Forecast = mydate(params[:transmission_date][:S8_Forecast])
        @other.S7_Actual = mydate(params[:transmission_date][:S7_Actual])
        @other.S8_Actual = mydate(params[:transmission_date][:S8_Actual])
        @other.node_id = params[:foo][:split_node_id]
        @other.Work_Type = 'Node Split'

        tmp_lead_capacity = @original_node.Existing_Capacity - @original_node.Required_Capacity ### Remove capacity from Original node
        tmp_other_capacity = @original_node.Required_Capacity #### Assign Capacity to new node
        @lead.Existing_Capacity = 0 ## set new requested capacities
        @other.Existing_Capacity = 0
        @original_node.Required_Capacity = 0 ## set jv capacity to 0
        @lead.Required_Capacity = tmp_lead_capacity
        @other.Required_Capacity = tmp_other_capacity
        @other.Active_Node_Owner = Node.find(@other.node_id).node_owner
        @tmp_lead_node = @lead
        tmp_lead_operator = @tmp_lead_node.Active_Node_Owner

        if tmp_lead_operator == 'Joint'
          if @other.Active_Node_Owner == 'Vodafone' or @other.Active_Node_Owner == 'VHA'
            tmp_lead_operator = 'Optus'
          else
            tmp_lead_operator = 'Vodafone'
          end
        end
        @original_node.Request_No = tmp_request_no.to_i + 1
        @lead.Request_No = tmp_request_no.to_i + 2
        @other.Request_No = tmp_request_no.to_i + 3
        @lead.Active_Node_Owner = tmp_lead_operator
        @lead.Invoice_Party = @lead.Active_Node_Owner
        @other.Invoice_Party = @other.Active_Node_Owner
        @original_node.Split_No = 0
        @lead.Split_No = 0
        @other.Split_No = 0

        @original_node.save
        @lead.save
        @other.save
      when "Cancel"
        @original_node = TransmissionDate.new
        @original_node.attributes = params[:transmission_date]
    end ## case
    redirect_to :action => "show", :id => @original_node.node.site_id
  end

  def mydate(indate)
    #debugger
    puts indate
    return if indate.blank?
    begin
      tmpdate = Date.strptime(indate, '%d/%m/%Y').strftime('%Y-%m-%d')
    rescue
      begin
        tmpdate = Date.strptime(indate, '%m/%d/%Y').strftime('%Y-%m-%d')
      rescue
        begin
          tmpdate = Date.strptime(indate, '%Y-%m-%d').strftime('%Y-%m-%d')
        rescue
          begin
            tmpdate = Date.strptime(indate, '%B %d, %Y').strftime('%Y-%m-%d')
          rescue
            tmpdate = nil
          end

        end
      end
    end
    puts tmpdate
    if tmpdate < '0100-01-01'
      # if year is less than 100 AD , change the first digit of the year to 2
      # only because we know the JV started in 2004 !!!!
      # If the JV is still around in 2100, we may have an issue :-)
      tmpdate[0]='2'
    end
    puts tmpdate
    tmpdate
  end


end