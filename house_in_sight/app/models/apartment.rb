class Apartment < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :price, :tag_list
  acts_as_taggable
  mount_uploader :image_url, ImageUploader
end
