class PrimarySchool
  include Mongoid::Document
  field :name, type: String
  field :level, type: String
  field :address, type: String
  field :phone, type: String
  field :feature, type: String

  has_and_belongs_to_many :middle_schools
  belongs_to :district
  attr_accessible :name, :level, :address, :phone, :feature, :district, :middle_schools
end
