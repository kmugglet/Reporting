class Cell < ActiveRecord::Base
  belongs_to :node
  belongs_to :UARFCN
  belongs_to :spin
  #validates_presence_of :node_id
end
