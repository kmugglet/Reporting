class MilestoneImportsController < ApplicationController
  # GET /milestone_imports
  # GET /milestone_imports.xml
  def index
    @milestone_imports = MilestoneImport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestone_imports }
    end
  end

  # GET /milestone_imports/1
  # GET /milestone_imports/1.xml
  def edit
    @milestone_import = MilestoneImport.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @milestone_import }
    end
  end

  # GET /milestone_imports/new
  # GET /milestone_imports/new.xml
  def new
    @milestone_import = MilestoneImport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @milestone_import }
    end
  end

  # GET /milestone_imports/1/edit
  def edit
    @milestone_import = MilestoneImport.find(params[:id])
  end

  # POST /milestone_imports
  # POST /milestone_imports.xml
  def create
    @milestone_import = MilestoneImport.new(params[:milestone_import])

    respond_to do |format|
      if @milestone_import.save
        flash[:notice] = 'MilestoneImport was successfully created.'
        format.html { redirect_to(@milestone_import) }
        format.xml  { render :xml => @milestone_import, :status => :created, :location => @milestone_import }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @milestone_import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /milestone_imports/1
  # PUT /milestone_imports/1.xml
  def update
    @milestone_import = MilestoneImport.find(params[:id])

    respond_to do |format|
      if @milestone_import.update_attributes(params[:milestone_import])
        flash[:notice] = 'MilestoneImport was successfully updated.'
        format.html { redirect_to(@milestone_import) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @milestone_import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /milestone_imports/1
  # DELETE /milestone_imports/1.xml
  def destroy
    @milestone_import = MilestoneImport.find(params[:id])
    @milestone_import.destroy

    respond_to do |format|
      format.html { redirect_to(milestone_imports_url) }
      format.xml  { head :ok }
    end
  end
end
