class Base 
  include Mongoid::Document
  field :created, type: DateTime
  field :modified, :type => DateTime
  
  attr_accessor :created, :modified

  before_save :setDates
  attr_accessible :created, :modified

  def setDates
    if new_record?
        @created = DateTime.current
    elsif changed?
        @modified = DateTime.current
    end
    
  end
  
end