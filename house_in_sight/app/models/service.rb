class Service
  include Mongoid::Document
  field :name, type: String
  field :phone, type: String

  embeds_one :address
  attr_accessible :name, :address, :phone
end
