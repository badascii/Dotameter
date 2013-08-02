# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

heroes = DotaAPI.get_heroes

heroes.each do |hero|
  Hero.create({ name: hero.name,
                valve_id: hero.id
              })
end