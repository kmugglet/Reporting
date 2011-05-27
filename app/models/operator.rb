class Operator < ActiveRecord::Base
  has_many :transmission_dates
  has_many :spins
end
