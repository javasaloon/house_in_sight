class Address
  include Mongoid::Document
  field :name, type: String

  embeds_one :point

  attr_accessible :name, :point
end
