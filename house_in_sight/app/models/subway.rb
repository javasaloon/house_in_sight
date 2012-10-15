class Subway 
  include Mongoid::Document
  field :number, :type => String
  has_and_belongs_to_many :apartments
end
