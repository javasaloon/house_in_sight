class District 
  include Mongoid::Document
  field :title, :type => String
  has_many :apartments
end
