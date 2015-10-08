# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

map = Map.create(name: "Dark Moon")

routes = [
  { origin: "A", destination: "B",  distance: 10 },
  { origin: "B", destination: "D",  distance: 15 },
  { origin: "A", destination: "C",  distance: 20 },
  { origin: "C", destination: "D",  distance: 30 },
  { origin: "B", destination: "E",  distance: 50 },
  { origin: "D", destination: "E",  distance: 30 }
].each do |route_hash|
  map.routes.create(route_hash)
end
