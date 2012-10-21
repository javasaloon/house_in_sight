class Apartment 
  include Mongoid::Document
  include Mongoid::Document::Taggable
  field :created, type: DateTime
  field :modified, :type => DateTime
  before_save :setDates

  field :description, :type => String
  field :image_url, :type => String
  field :name, :type => String
  field :price, :type => Integer 



  field :floor, :type => Integer
  field :floor_total, :type => Integer

  field :bedroom_count, :type => Integer
  field :livingroom_count, :type => Integer
  field :washroom_count, :type => Integer

  field :age, :type => Integer
  field :build_type, :type => String
  field :new_build, :type => Boolean
  field :five_years, :type => Boolean
  field :only, :type => Boolean  

  belongs_to :district
  has_and_belongs_to_many :subways

  attr_accessible :id, :description, :image_url, :name, :price, :tag_list,
  :floor, :floor_total, :bedroom_count, :livingroom_count, :washroom_count, 
  :age, :build_type, :new_build, :five_years, :only, :district_id, :created,
  :modified
  
  #acts_as_taggable
  mount_uploader :image_url, ImageUploader

  def self.tag_counts
    #Apartment.select("tags.*, count(taggings.tag_id) as count").
      #joins(:taggings).group("taggings.tag_id")
    [{ :name=> 'tag', :count => 1 }]
  end

  def setDates
    if new_record?
        @created = DateTime.current
    elsif changed?
        @modified = DateTime.current
    end
    
  end
end
