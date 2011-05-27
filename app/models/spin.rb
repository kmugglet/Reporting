class Spin < ActiveRecord::Base

  cattr_reader :per_page
  @@per_page = 10

  belongs_to :user
  belongs_to :tracking
  belongs_to :spin_change_reason
  belongs_to :spin_change_type
  belongs_to :spin_tracking_categories
  has_many :sites
  has_many :nodes
  has_many :cells
  has_many :documents
  accepts_nested_attributes_for :documents, :allow_destroy => true
  accepts_nested_attributes_for :sites, :allow_destroy => false
  validates_presence_of :user_id

end
