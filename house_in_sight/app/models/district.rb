class District
  include Mongoid::Document
  field :name, :type => String
  has_many :communities
  has_many :parks
  belongs_to :city

  attr_accessible :name, :city
end
