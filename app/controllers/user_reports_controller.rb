class UserReportsController < ApplicationController
#  require 'pony'

  # GET /user_reports
  # GET /user_reports.xml
  def index
    @user_reports = UserReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @user_reports }
    end
  end

  # GET /user_reports/1
  # GET /user_reports/1.xml
  def show
    @user_report = UserReport.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.xml { render :xml => @user_report }
    end
  end

  # GET /user_reports/new
  # GET /user_reports/new.xml
  def new
    @user_report = UserReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user_report }
    end
  end

  # GET /user_reports/1/edit
  def edit
    @user_report = UserReport.find(params[:id])
  end

  # POST /user_reports
  # POST /user_reports.xml
  def create
    @user_report = UserReport.new(params[:user_report])

    respond_to do |format|
      if @user_report.save
        flash[:notice] = 'UserReport was successfully created.'
        format.html { redirect_to(@user_report) }
        format.xml { render :xml => @user_report, :status => :created, :location => @user_report }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_reports/1
  # PUT /user_reports/1.xml
  def update
    @user_report = UserReport.find(params[:id])

    respond_to do |format|
      if @user_report.update_attributes(params[:user_report])
        flash[:notice] = 'UserReport was successfully updated.'
        format.html { redirect_to(@user_report) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @user_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_reports/1
  # DELETE /user_reports/1.xml
  def destroy
    @user_report = UserReport.find(params[:id])
    @user_report.destroy

    respond_to do |format|
      format.html { redirect_to(user_reports_url) }
      format.xml { head :ok }
    end
  end

  def send_report
#    Pony.mail(:to => 'you@example.com', :from => 'me@example.com', :subject => 'Hello')
  end
end
