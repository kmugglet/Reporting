class TransmissionDate < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :node
  #belongs_to :site, :through => :nodes
  belongs_to :link_technology
  belongs_to :operator

  def jvid
    site.jv_site if site
  end

  def jvid=(id)
    self.jv_site = Site.find(:id) unless id.blank?
  end
#validates_presence_of :Date_Raised, :node_id, :Request_No, :Work_Type, :Existing_Capacity, :Required_Capacity, :link_technology_id
end
