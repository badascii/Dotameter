# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

heroes = DotaAPI.get_heroes["result"]["heroes"]

heroes.each do |hero|
  Hero.create!({ name: hero["name"].gsub('npc_dota_hero_', ''),
                 valve_id: hero["id"].to_i
               })
end