class Node < ActiveRecord::Base
  belongs_to :site
  has_many :transmission_dates
  has_many :cells
  belongs_to :node_type
  accepts_nested_attributes_for :cells, :reject_if => lambda { |a| a[:node_id].blank? }, :allow_destroy => true
  belongs_to :spin

  #validates_presence_of :site_id

end
