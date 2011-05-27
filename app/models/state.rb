class State < ActiveRecord::Base
  has_many :sites
  has_many :rnc_names
end
