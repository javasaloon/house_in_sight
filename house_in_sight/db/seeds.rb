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
  d = District.create!(name: names[0], city: cities.first)
  districts << d
  names[1..names.length].each do |community|
    communities << Community.create!(name: community, district: d)
  end
end
p districts
p communities

metro = []
stations = []
lines = File.open("/Users/chengxiang/workspace/assets/metros.txt", "r").read
lines.each_line do |line|
  names = line.split
  next if names.empty?
  p names
  m = Metro.create!(name: names[0], city: cities.first)
  metro << m
  names[1..names.length].each do |s|
    stations << Station.create!(name: s, metro: m)
  end
end
p metro
p stations

parks = []
lines = File.open("/Users/chengxiang/workspace/assets/parks.txt", "r").read
lines.each_line do |line|
  names = line.split
  next if names.empty?
  p names
  d = District.where(name: names[0]).first
  if names.length()>2
    parks << Park.create(name: names[1], address: names[2], phone:names[3], traffic: names[4], district: d)
  else
    parks << Park.create(name: names[1], district: d)
  end
end
p parks

hospitals = []
lines = File.open("/Users/chengxiang/workspace/assets/hospitals.txt", "r").read
lines.each_line do |line|
  names = line.split
  next if names.empty?
  p names
  d = District.where(name: names[0]).first
  names[1..names.length].each do |s|
    hospitals << Hospital.create(name: names[1], district: d)
  end
end
p hospitals
gardens = []
lines = File.open("/Users/chengxiang/workspace/assets/gardens_demo.txt", "r").read
lines.each_line do |line|
  names = line.split
  next if names.empty?
  p names
  d = District.where(name: names[0]).first
  p d
  gardens << Garden.create(name: names[1], level: "示范园", phone:names[2], address: names[3..names.length].join('; '), district: d)
end
p gardens

primary_schools = []
middle_schools = []
lines = File.open("/Users/chengxiang/workspace/assets/primary_schools.txt", "r").read
lines.each_line do |line|
  names = line.split
  next if names.empty?
  p names
  d = District.where(name: names[0]).first
  ps = PrimarySchool.create!(name: names[1], feature: names[2], district: d)
  primary_schools << ps
  if names.length>3
    names[3..names.length].each do |item|
      ms = MiddleSchool.where(name: item).first || MiddleSchool.create!(name: item, district: d) if not ms
      ps.middle_schools << ms
      ps.upsert
      ms.primary_schools << ps
      ms.upsert
      middle_schools << ms
    end
  end
end
p primary_schools
p middle_schools

villages = []
%w(樱花坊 海桐苑 海桐小区).each do |name|
  villages << Village.create!(name: name, community: communities.first)
end
p villages
ying_hua_fang = Village.where(name: "樱花坊").first

apartment = Apartment.create!(village: ying_hua_fang,
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

apartment = Apartment.create!(village: ying_hua_fang,
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

apartment = Apartment.create!(village: ying_hua_fang,
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

apartment = Apartment.create!(village: ying_hua_fang,
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

hai_tong_yuan = Village.where(name: "海桐苑").first

apartment = Apartment.create!(village: hai_tong_yuan,
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

apartment = Apartment.create!(village: hai_tong_yuan,
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

apartment = Apartment.create!(village: hai_tong_yuan,
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

apartment = Apartment.create!(village: hai_tong_yuan,
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



