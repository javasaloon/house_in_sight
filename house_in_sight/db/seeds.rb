# encoding: UTF-8
def seed(data_dir, city)
  #seed_districts(data_dir, city)
  #seed_metros(data_dir, city)
  #seed_services(data_dir, city)

  seed_districts_features()
end

def seed_districts_features()
  p "seeding districts' features ... "
  featureHash = {
    :parks => ["绿色街区"] ,
    :stations  => ["交通便利"] ,
    :gardens => ["幼儿园学区"] ,
    :hospitals => ["医院密集"] ,
    :primary_schools => ["小学学区"] ,
    :middle_schools => ["中学学区"]
  }
  featureHash.each do |k, v|
    featureHash[k] = v.insert(0, District.avgOf(k))
  end
  p featureHash

  District.all.each do |dis|
    features = []
    featureHash.each do |k, v|
      features << v[1] if dis.countOf(k) > v[0]
    end

    p dis.name
    p features
    dis.update_attributes(
      features: features
    )
  end

end

def seed_districts(data_dir, city)
  p "seeding districts ... "
  lines = File.open("#{data_dir}/districts.txt", "r").read
  lines.each_line do |line|
    words = line.split
    d = District.create!(name: words[0], city: city)
    words[1..words.length].each do |community|
      Community.create!(name: community, district: d)
    end
  end
end

def seed_metros(data_dir, city)
  p "seeding metros ... "
  lines = File.open("#{data_dir}/metros.txt", "r").read
  lines.each_line do |line|
    words = line.split
    next if words.empty?
    m = Metro.create!(name: words[0], city: city)
    words[1..words.length].each do |s|
      Station.create!(name: s, metro: m)
    end
  end
end

def seed_service(txt, service)
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
    addr = Address.create(name: words[2], point: point)
    phone = words[3] || ""
    service.create(name: words[1], address: addr, phone: phone, community: comm)
  end
end

def seed_services(data_dir, city)
  serviceMap = [
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

  #service = serviceMap [8]
  serviceMap.each do |service|
    seed_service("#{data_dir}/#{service[:txt]}", service[:clazz])
  end
end


data_dir = "/Users/chengxiang/workspace/assets"
sh = City.where(name: "上海").first || City.create!(name: "上海")

seed(data_dir, sh)
