namespace :dota do
  task :heroes => :environment do
    Hero.destroy_all
    heroes = DotaAPI.get_heroes["result"]["heroes"]
    heroes.each do |hero|
      Hero.create!({ name: hero["name"].gsub('npc_dota_hero_', ''),
                     valve_id: hero["id"].to_i
                  })
    end
    puts "Database seeded with " + Hero.all.length.to_s + " heroes."
  end
end