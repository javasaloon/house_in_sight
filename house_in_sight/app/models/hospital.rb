class Hospital
  include Mongoid::Document
  field :name, type: String
  field :level, type: String
  field :address, type: String
  field :phone, type: String
  field :traffic, type: String
  field :feature, type: String

  belongs_to :district
  attr_accessible :name, :level, :address, :phone, :traffic, :district
end
