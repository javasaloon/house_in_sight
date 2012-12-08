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

def seed(txt, service)
  p "seeding #{service} using #{txt} ... "
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
    service.create(name: words[1], address: addr, phone: phone)
  end
end

services = [
  {:txt => :parks_sh, :clazz => Park},
  {:txt => :gardens_sh, :clazz => Garden},
  {:txt => :primary_schools_sh, :clazz => PrimarySchool},
  {:txt => :middle_schools_sh, :clazz => MiddleSchool},
  {:txt => :high_schools_sh, :clazz => HighSchool},
  {:txt => :colleges_sh, :clazz => College},
  {:txt => :suppermarkets_sh, :clazz => Suppermarket},
  {:txt => :stations_sh, :clazz => Station},
  {:txt => :hospitals_sh, :clazz => Hospital}
]
#service = services [8]
services.each do |service|
  seed("#{data_dir}/#{service[:txt]}", service[:clazz])
end
