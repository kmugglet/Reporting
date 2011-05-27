class MilestoneDate < ActiveRecord::Base
  belongs_to :Milestone
  belongs_to :Node

end
