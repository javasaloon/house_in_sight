class Metro
  include Mongoid::Document
  field :name, type: String
  has_many :stations
  belongs_to :city
  attr_accessible :name, :city
end
