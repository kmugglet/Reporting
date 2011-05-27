class UserReport < ActiveRecord::Base
  belongs_to :report
  belongs_to :user

  def report_name
    self.report.name
  end

end
