class Site < ActiveRecord::Base
  has_many :nodes
  has_many :transmission_dates, :through => :nodes
  belongs_to :pre_build_status
  belongs_to :macro_type
  belongs_to :state
  belongs_to :area
  belongs_to :spin
  belongs_to :site_source_program
  belongs_to :status
  accepts_nested_attributes_for :nodes, :reject_if => lambda { |a| a[:site_id].blank? }, :allow_destroy => true

  validates_presence_of :jv_site
end
