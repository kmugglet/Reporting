# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  #layout "sites"
  #...
  before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time
  before_filter :update_activity_time, :except => [:login, :logout]

  def session_expiry
    reset_session
    flash[:error] = 'Your session has expired. Please login again.'
    redirect_to :controller => 'admin', :action => 'login'
  end

  def update_activity_time
    session[:expires_at] = 60.minutes.from_now
  end

  def update_activity_time
    from_now = 60.minutes.from_now
    if session[:expires_at].blank?
      session[:expires_at] = from_now
    else
      @time_left = (session[:expires_at].utc - Time.now.utc).to_i
      unless @time_left > 0
        session[:expires_at] = from_now
        session_expiry
      end
    end
  end

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '8fc080370e56e929a2d5afca5540a0f7'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end

#  def authorize_section(controller)
#    unless User.find_by_id(session[:user_id])
#
#      redirect_to :controller => 'admin', :action => 'login'
#    else
#    end
#
#  end


end


require 'roo'
require 'csv'

class SpreadsheetParser
  def self.parse(file)
    name = file
    if name =~ /\.csv/
      CSV::Reader.parse(file).each do |row|
        yield row
      end
    else
      roo = build_roo_wrapper(name)
      roo.default_sheet = roo.sheets.last
      1.upto(roo.last_row) do |line|
        row = []
        1.upto(roo.last_column) do |column|
          row << roo.cell(line, column)
        end
        yield row
      end
    end
  end

  protected

  def self.build_roo_wrapper(name)
    roo = nil
    if name =~ /\.xlsx/
      roo = Excelx.new(name)
    elsif name =~ /\.xls/
      roo = Excel.new(name)
    elsif name =~ /\.ods/
      roo = Openoffice.new(name)
    else
      raise "Cannot parse this file, unrecognized format"
    end
    roo
  end

end
