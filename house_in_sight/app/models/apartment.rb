class Apartment 
  include Mongoid::Document
  include Mongoid::Document::Taggable
  field :description, :type => String
  field :image_url, :type => String
  field :name, :type => String
  field :price, :type => String

  attr_accessible :description, :image_url, :name, :price, :tag_list
  #acts_as_taggable
  mount_uploader :image_url, ImageUploader

  def self.tag_counts
    #Apartment.select("tags.*, count(taggings.tag_id) as count").
      #joins(:taggings).group("taggings.tag_id")
    [{ :name=> 'tag', :count => 1 }]
  end
end
