namespace :dota do
#---------------------------------------------------------------------

  desc "clears DB of heroes only"
  task :clear_db => :environment do
    Hero.destroy_all
  end

  # should call method that calls api to populate hero stats
  desc "fetches detailed_matches & populates mongoDB with 100 starting from last fetched seq_num"
  task :get_matches, [:seq_start] => [:environment] do |t, args|
    match_fetch = MatchFetch.new
    match_fetch.get_matches(args)

    puts "--------------"
    puts "TASK COMPLETED"
    puts "--------------"
  end

  # task :get_lastest_matches do
  #   Rake::Task[:get_matches].invoke(Match.last.match_seq_num)
  # end

  desc "creates/updates static hero stats"
  task :get_heroes => [:environment] do
    hero_fetch = HeroFetch.new
    hero_fetch.build_heroes

    puts "--------------"
    puts "TASK COMPLETED"
    puts "--------------"
  end
end