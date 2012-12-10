class Service
  include Mongoid::Document
  field :name, type: String
  field :phone, type: String

  belongs_to :community
  embeds_one :address
  attr_accessible :name, :address, :phone, :community
end
