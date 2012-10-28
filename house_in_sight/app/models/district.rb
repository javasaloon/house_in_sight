class District 
  include Mongoid::Document
  field :name, :type => String
  has_many :community
  belongs_to :city

  attr_accessible :name, :city_id
end
