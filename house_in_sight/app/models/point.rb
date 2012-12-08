class Point
  include Mongoid::Document

  field :lng, type: String
  field :lat, type: String

  attr_accessible :lng, :lat
end
