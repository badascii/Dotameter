namespace :dota do

  VERBOSE = true

  # FIXME: move to helper(?) along with sibling code in slashdot_api
  # if VERBOSE = true, displays output and colorizes it.
  # defaults to 'undef' using env colors
  def display(message, color=:undef)
    if VERBOSE == true
      colorize = {
        :black  => lambda { |text| "\033[30m#{text}\033[0m" },
        :red    => lambda { |text| "\033[31m#{text}\033[0m" },
        :green  => lambda { |text| "\033[32m#{text}\033[0m" },
        :yellow => lambda { |text| "\033[33m#{text}\033[0m" },
        :white  => lambda { |text| "\033[37m#{text}\033[0m" },
        :blue   => lambda { |text| "\033[34m#{text}\033[0m" },
        :undef  => lambda { |text| "#{text}"                }
      }

      # colorize the output, baby
      puts colorize[color].call(message)
    end
  end

#---------------------------------------------------------------------

  desc "clears DB of heroes only"
  task :clear_db => :environment do
    Hero.destroy_all
  end

  #should call method that calls api to populate hero stats
  desc "fetches heroes from wiki and populates DB with heroes"
  task :get_heroes => :environment do
    heroes = DotaAPI.get_heroes["result"]["heroes"]
    heroes.each do |hero|
      new_hero = Hero.find_or_create_by!(name: hero["name"].gsub('npc_dota_hero_', ''))
      new_hero.valve_id = hero["id"].to_i
      display "#{new_hero.name} Saved!", :green if new_hero.save!
    end
    puts "Database seeded with " + Hero.all.length.to_s + " heroes."
  end
end

