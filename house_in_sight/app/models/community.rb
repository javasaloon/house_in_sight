class Community
  include Mongoid::Document
  field :name, type: String

  has_many :parks
  has_many :stations
  has_many :gardens
  has_many :hospitals
  has_many :primary_schools
  has_many :middle_schools

  has_many :village
  belongs_to :district

  attr_accessible :name, :district

  def countOf(serviceName)
    method(serviceName).call().length
  end

end
