namespace :dota do
  require 'DB'
#---------------------------------------------------------------------

  desc "clears DB of heroes only"
  task :clear_db => :environment do
    Hero.destroy_all
  end

  # desc "fetches heroes from wiki and populates DB with heroes"
  # task :get_heroes => :environment do
  #   heroes = DotaAPI.get_heroes["result"]["heroes"]
  #   heroes.each do |hero|
  #     new_hero = Hero.find_or_create_by!(name: hero["name"].gsub('npc_dota_hero_', ''))
  #     new_hero.valve_id = hero["id"].to_i
  #     display "#{new_hero.name} Saved!", :green if new_hero.save!
  #   end
  #   puts "Database seeded with " + Hero.all.length.to_s + " heroes."
  # end


  # should call method that calls api to populate hero stats
  desc "fetches detailed_matches & populates mongoDB with 100 starting from last fetched seq_num"
  task :get_matches, [:seq_start] => [:environment] do |t, args|
    DB.build_matches(args)
  end

  # task :get_lastest_matches do
  #   Rake::Task[:get_matches].invoke(Match.last.match_seq_num)
  # end
end