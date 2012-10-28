class Subway 
  include Mongoid::Document
  field :number, :type => String
  has_many :apartments
  has_many :community
  belongs_to :city
end
