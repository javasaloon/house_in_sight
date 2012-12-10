class District
  include Mongoid::Document
  field :name, :type => String
  field :features, :type => Array

  has_many :communities

  belongs_to :city

  attr_accessible :name, :features, :city

  def countOf(serviceName)
    communities.inject(0) do |sum, comm|
      sum + comm.countOf(serviceName)
    end
  end

  def self.avgOf(serviceName)
    District.all.inject(0) do |sum, d|
      sum + d.countOf(serviceName)
    end
    sum / District.count
  end
end
