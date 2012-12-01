class Station
  include Mongoid::Document
  field :name, type: String
  belongs_to :metro
  attr_accessible :name, :metro_id
end
