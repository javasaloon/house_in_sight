# encoding: utf-8
class Apartment 
  include Mongoid::Document
  include Mongoid::Document::Taggable
  field :created, type: DateTime, default: -> { DateTime.current  }
  field :modified, :type => DateTime, default: -> { DateTime.current  }
  before_save :setModified
   

  field :description, :type => String
  field :image_url, :type => String
  field :name, :type => String
  field :price, :type => Integer 



  field :floor, :type => Integer
  field :floor_total, :type => Integer
  field :road, :type => String


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
  :modified, :road
  
  #acts_as_taggable
  mount_uploader :image_url, ImageUploader

  def layout
    "#{self.bedroom_count} 室 #{self.livingroom_count} 厅 #{self.washroom_count} 卫"
  end
  def road_info
    if self.road
      "靠近：#{self.road}"
    else
      "不靠路"
    end
  end
  def price_info
    (self.price/10000).round.to_s + " 万" 
  end
  def update_info
    diff = DateTime.current.to_time() - self.modified.to_time()   
    time = nil
    day = diff / (3600 * 24)
    if day > 1
      time = day.round().to_s + " 天" 
    else
      hour = diff / 3600
        if hour > 1
          time = hour.round().to_s + " 小时"
        else
          minute = diff / 60
          if minute > 1
            time = minute.round().to_s + " 分钟"
          else
            time = diff.round().to_s + " 秒"
          end
        end
    end
    time.to_s + "前更新"
  end

  def floor_info
    "#{self.floor} / #{self.floor_total} 楼"
  end
  def self.tag_counts
    #Apartment.select("tags.*, count(taggings.tag_id) as count").
      #joins(:taggings).group("taggings.tag_id")
    [{ :name=> 'tag', :count => 1 }]
  end

  def setModified 
    self.modified = DateTime.current 
  end
   
end
