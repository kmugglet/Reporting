class Document < ActiveRecord::Base
  has_attachment :storage => :file_system

  #validates_as_attachment

  belongs_to :spin
  belongs_to :user
  belongs_to :import

end
