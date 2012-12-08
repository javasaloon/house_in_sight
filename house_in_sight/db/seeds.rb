# encoding: UTF-8
cities = []
%w(上海 北京 广州).each do |name|
  cities << City.create!(name: name)
end
sh = cities.first

data_dir = "/Users/chengxiang/workspace/assets"

lines = File.open("#{data_dir}/districts.txt", "r").read
lines.each_line do |line|
  words = line.split
  d = District.create!(name: words[0], city: sh)
  words[1..words.length].each do |community|
    Community.create!(name: community, district: d)
  end
end

lines = File.open("#{data_dir}/metros.txt", "r").read
lines.each_line do |line|
  words = line.split
  next if words.empty?
  m = Metro.create!(name: words[0], city: sh)
  words[1..words.length].each do |s|
    Station.create!(name: s, metro: m)
  end
end

def seed(txt)
  lines = File.open("#{txt}.txt", "r").read
  lines.each_line do |line|
    words = line.split(";")
    next if words.empty?
    words = words.collect {|item| item.strip}
    coordinators = words[-1][1..-2].split(",")
    point = Point.create(lng: coordinators[0], lat: coordinators[1])
    comm = Community.where(name: /.*#{words[0]}.*/).first
    p "not found #{words[0]}" if comm == nil
    addr = Address.create(name: words[2], community: comm, point: point)
    phone = words[3] || ""
    Park.create(name: words[1], address: addr, phone: phone)
  end
end

seed("#{data_dir}/parks_sh")
