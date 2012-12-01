# encoding: UTF-8
cities = []
%w(上海 北京 广州).each do |name|
  cities << City.create!(name: name)
end
p cities

districts = []
communities = []
lines = File.open("/Users/chengxiang/workspace/assets/districts.txt", "r").read
lines.each_line do |line|
  names = line.split
  p names
  d = District.create!(name: names[0], city_id: cities.first.id)
  districts << d
  names[1..names.length].each do |community|
    communities << Community.create!(name: community, district_id: d.id)
  end
end
p districts
p communities

metro = []
stations = []
lines = File.open("/Users/chengxiang/workspace/assets/metro.txt", "r").read
lines.each_line do |line|
  names = line.split
  next if names.empty?
  p names
  m = Metro.create!(name: names[0], city_id: cities.first.id)
  metro << m
  names[1..names.length].each do |s|
    stations << Station.create!(name: s, metro_id: m.id)
  end
end
p metro
p stations

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
  image_url: File.open('/Users/chengxiang/workspace/assets/images/2.jpeg')
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
  image_url: File.open('/Users/chengxiang/workspace/assets/images/3.jpeg')
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
  image_url: File.open('/Users/chengxiang/workspace/assets/images/4.jpeg')
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
  image_url: File.open('/Users/chengxiang/workspace/assets/images/1.jpeg')
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
  image_url: File.open('/Users/chengxiang/workspace/assets/images/2.jpeg')
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
  image_url: File.open('/Users/chengxiang/workspace/assets/images/3.jpeg')
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
  image_url: File.open('/Users/chengxiang/workspace/assets/images/4.jpeg')
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
  image_url: File.open('/Users/chengxiang/workspace/assets/images/1.jpeg')
)
p apartment



