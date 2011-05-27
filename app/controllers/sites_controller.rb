class SitesController < ApplicationController
  def index
    @sites = Site.first( :conditions => ['jv_site like ?', "%#{params[:search]}%"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @sites }
    end
  end

  def show
    #debugger
    jv_site = params[:site][:jv_site]
    @find_site = VSiteList.first(:conditions => ["jv_site like ?","%#{jv_site}%"])
    if @find_site.blank?
      flash[:error] = "Cannot find site with that ID"
      redirect_to :action => 'index'
    else
      @site = Site.find(@find_site['id'])
      site_id = @site['id'].to_s
      @nodes = @site.nodes
      @spin_sites = Site.find_all_by_jv_site(@site.jv_site, :conditions => ['spin_id is not null'])
      @transmission_dates = TransmissionDate.find_by_sql("select t.* from transmission_dates t, nodes n, sites s where s.id = n.site_id and t.node_id = n.id and s.id = '"+site_id+"' order by t.Request_No")
      @split = TransmissionDate.find_by_sql("select v.id from v_no_transmission v, sites s where v.site_id = s.id and s.id = '"+site_id+"' limit 1")
    end

  end

  def edit
    site_id = params[:id]
    @site = Site.find(site_id)
  end

  def update
    @site = Site.find(params[:id])
    @new_site = Site.new
    @new_site.attributes = @site.attributes
    @new_site.historical=true
    @new_site.updated_at = Date.today
    #TODO
    @new_site.spin_id = 0  # Universal spin id  ## will amend code to auto create admin spin for changes.
    @new_site.save

    respond_to do |format|
      if @site.update_attributes(params[:site])
        flash[:notice] = "Site #{@site.jv_site} was successfully updated."
        format.html { redirect_to(:action=>'index') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @site.errors,
                            :status => :unprocessable_entity }
      end
    end

  end
end
