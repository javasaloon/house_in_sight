class District
  include Mongoid::Document
  field :name, :type => String
  has_many :communities
  has_many :parks
  has_many :metros
  has_many :gardens

  belongs_to :city

  attr_accessible :name, :city
end
