class Address
  include Mongoid::Document
  field :name, type: String

  embeds_one :point
  belongs_to :community

  attr_accessible :name, :point, :community
end
