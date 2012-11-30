class District
  include Mongoid::Document
  field :name, :type => String
  has_many :communities
  belongs_to :city

  attr_accessible :name, :city_id
end
