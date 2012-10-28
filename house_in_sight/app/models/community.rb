class Community
  include Mongoid::Document
  field :name, type: String
  has_many :village
  belongs_to :district
  attr_accessible :name, :district_id
end
