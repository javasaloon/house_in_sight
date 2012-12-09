class District
  include Mongoid::Document
  field :name, :type => String
  field :features, :type => Array

  has_many :communities
  #has_many :parks
  #has_many :metros
  #has_many :gardens
  #has_many :hospitals
  #has_many :primary_schools
  #has_many :middle_schools

  belongs_to :city

  attr_accessible :name, :features, :city
end
