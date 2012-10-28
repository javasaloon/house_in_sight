class City
  include Mongoid::Document
  field :name, type: String
  has_many :district
  attr_accessible :name
end
