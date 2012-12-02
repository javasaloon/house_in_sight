class MiddleSchool
  include Mongoid::Document
  field :name, type: String
  field :level, type: String
  field :address, type: String
  field :phone, type: String
  field :feature, type: String
  belongs_to :district
  has_and_belongs_to_many :primary_schools
  attr_accessible :name, :level, :address, :phone, :feature, :district, :primary_schools
end
