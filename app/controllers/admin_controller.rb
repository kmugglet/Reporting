#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create_spin training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class AdminController < ApplicationController

  # just display the form and wait for user to
  # enter a name and password

  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        if user.active
          session[:user_id] = user.id
          session[:spin_access] = user.spin_access
          session[:transmission_access] = user.transmission_access
          session[:report_access] = user.report_access
          session[:admin_access] = (user.admin_level > 2)
          session[:jvo_access] = user.jvo

          redirect_to(:action => "index")
        end
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end

  def logout
    session[:user_id] = :logged_out
    flash[:notice] = "Logged out"
    session[:spin_access] = nil
    session[:transmission_access] = nil
    session[:report_access] = nil
    session[:admin_access] = nil
    session[:jvo_access]= nil
    redirect_to(:action => "login")
  end

  def index
    @user = User.find(session[:user_id])
  end

  def jvo_page
    Dir::chdir('/home/keith/Reporting/public/reports/dashboard')
    @dashboard_files = Dir::glob('dashboard_*.xls').sort.reverse
    Dir::chdir('/home/keith/Reporting/public/reports/logs')
    @log_files = Dir::glob('import_*.log').sort.reverse

  end

  def content
    @parent = params[:dir]
    @dir = Admin.new("public/"+@parent).get_content
  end


end
