class City
  include Mongoid::Document
  field :name, type: String
  has_many :districts
  has_many :metros
  attr_accessible :name
end
