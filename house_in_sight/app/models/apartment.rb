class Apartment < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :price
  mount_uploader :image_url, ImageUploader
end
