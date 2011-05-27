class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.xml
  def index
    @documents = Document.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.xml
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.xml { render :xml => @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.xml
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.xml
  def create
    debugger
    @document = Document.new

    @document.update_attributes(params[:document])

    action = params[:commit]

    respond_to do |format|
      if @document.save
        debugger

        format.html { redirect_to(@document) }
        format.xml { render :xml => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end

    debugger
    case action
      when 'Import VHA Milestones'
        import_vha_data(@document)
      when 'Import Optus Milestones'
        import_optus_data(@document)
      when 'Import Transmission Data'
        import_tx_data(@document)
    end

  end

  # DELETE /documents/1
  # DELETE /documents/1.xml
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to(documents_url) }
      format.xml { head :ok }
    end
  end

end