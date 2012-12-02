class Park
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :phone, type: String
  field :traffic, type: String
  belongs_to :district
  attr_accessible :name, :address, :phone, :traffic, :district
end
