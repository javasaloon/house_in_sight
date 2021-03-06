# encoding: UTF-8
cities = []
%w(上海 北京 广州).each do |name|
  cities << City.create!(name: name) 
end
p cities

districts = []
%w(浦东新区 闵行区 嘉定区).each do |name|
  districts << District.create!(name: name, city_id: cities.first.id)
end
p districts

communities = []
%w(世纪公园 潍坊 张江).each do |name|
  communities << Community.create!(name: name, district_id: districts.first.id)
end 
p communities

villages = []
%w(樱花坊 海桐苑 海桐小区).each do |name|
  villages << Village.create!(name: name, community_id: communities.first.id)
end
p villages
ying_hua_fang = Village.where(name: "樱花坊").first.id

apartment = Apartment.create!(village_id: ying_hua_fang,
  building: 6, room: 603,
  title: "高性价比的好房子",
  price: 240, floor: 6, floor_total: 6, road: "海桐路",
  bedroom_count: 2, livingroom_count: 2, washroom_count: 1,
  area: 77.0, age: 1998, build_type: "商品房", 
  new_build: true, five_years: true, only: true,
  description: "高性价比的好房子，值得考虑",
  image_url: File.open('/Users/jacky/workspace/images/2.jpeg')
)
p apartment

apartment = Apartment.create!(village_id: ying_hua_fang,
  building: 6, room: 601,
  title: "高性价比的好房子",
  price: 233, floor: 6, floor_total: 6,
  bedroom_count: 2, livingroom_count: 2, washroom_count: 1,
  area: 77.0, age: 1998, build_type: "商品房", 
  new_build: true, five_years: true, only: true,
  description: "高性价比的好房子，值得考虑",
  image_url: File.open('/Users/jacky/workspace/images/3.jpeg')
)
p apartment

apartment = Apartment.create!(village_id: ying_hua_fang,
  building: 1, room: 101,
  title: "高性价比的好房子",
  price: 230, floor: 1, floor_total: 6, road: "海桐路",
  bedroom_count: 2, livingroom_count: 2, washroom_count: 1,
  area: 77.0, age: 1998, build_type: "商品房", 
  new_build: true, five_years: true, only: true,
  description: "高性价比的好房子，值得考虑",
  image_url: File.open('/Users/jacky/workspace/images/4.jpeg')
)
p apartment

apartment = Apartment.create!(village_id: ying_hua_fang,
  building: 6, room: 602,
  title: "高性价比的好房子",
  price: 300, floor: 6, floor_total: 6, road: "海桐路",
  bedroom_count: 3, livingroom_count: 2, washroom_count: 1,
  area: 100.0, age: 1998, build_type: "商品房", 
  new_build: true, five_years: true, only: true,
  description: "高性价比的好房子，值得考虑",
  image_url: File.open('/Users/jacky/workspace/images/1.jpeg')
)
p apartment

hai_tong_yuan = Village.where(name: "海桐苑").first.id

apartment = Apartment.create!(village_id: hai_tong_yuan,
  building: 6, room: 603,
  title: "高性价比的好房子",
  price: 240, floor: 6, floor_total: 6, road: "海桐路",
  bedroom_count: 2, livingroom_count: 2, washroom_count: 1,
  area: 77.0, age: 1998, build_type: "商品房", 
  new_build: true, five_years: true, only: true,
  description: "高性价比的好房子，值得考虑",
  image_url: File.open('/Users/jacky/workspace/images/2.jpeg')
)
p apartment

apartment = Apartment.create!(village_id: hai_tong_yuan,
  building: 6, room: 601,
  title: "高性价比的好房子",
  price: 233, floor: 6, floor_total: 6,
  bedroom_count: 2, livingroom_count: 2, washroom_count: 1,
  area: 77.0, age: 1998, build_type: "商品房", 
  new_build: true, five_years: true, only: true,
  description: "高性价比的好房子，值得考虑",
  image_url: File.open('/Users/jacky/workspace/images/3.jpeg')
)
p apartment

apartment = Apartment.create!(village_id: hai_tong_yuan,
  building: 1, room: 103,
  title: "高性价比的好房子",
  price: 230, floor: 1, floor_total: 6, road: "海桐路",
  bedroom_count: 2, livingroom_count: 2, washroom_count: 1,
  area: 77.0, age: 1998, build_type: "商品房", 
  new_build: true, five_years: true, only: true,
  description: "高性价比的好房子，值得考虑",
  image_url: File.open('/Users/jacky/workspace/images/4.jpeg')
)
p apartment

apartment = Apartment.create!(village_id: hai_tong_yuan,
  building: 6, room: 603,
  title: "高性价比的好房子",
  price: 300, floor: 6, floor_total: 6, road: "海桐路",
  bedroom_count: 3, livingroom_count: 2, washroom_count: 1,
  area: 100.0, age: 1998, build_type: "商品房", 
  new_build: true, five_years: true, only: true,
  description: "高性价比的好房子，值得考虑",
  image_url: File.open('/Users/jacky/workspace/images/1.jpeg')
)
p apartment



