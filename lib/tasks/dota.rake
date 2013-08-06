namespace :dota do

#---------------------------------------------------------------------

  desc "clears DB of heroes only"
  task :clear_db => :environment do
    Hero.destroy_all
  end

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


  # should call method that calls api to populate hero stats
  desc "fetches detailed_matches & populates mongoDB with 100 starting from last fetched seq_num"
  task :get_matches => :environment do

    FIRST_MATCH = 215_706_100

    # fetch according to initial release match number or last fetched
    last_fetched_seq = DetailedMatch.last.match_seq_num.to_i unless DetailedMatch.empty?
    last_fetched_seq ||= FIRST_MATCH

    begin
      returned_matches = DotaAPI.get_match_details_by_seq(last_fetched_seq + 1)["result"]

      returned_matches["matches"].each do |match|

        detailed_match = DetailedMatch.find_or_initialize_by(match_id: match["match_id"].to_s)

        if detailed_match.new_record?

          detailed_match["radiant_win"]             = match["radiant_win"]
          detailed_match["duration"]                = match["duration"]
          detailed_match["start_time"]              = match["start_time"]
          detailed_match["match_id"]                = match["match_id"]
          detailed_match["match_seq_num"]           = match["match_seq_num"]
          detailed_match["tower_status_radiant"]    = match["tower_status_radiant"]
          detailed_match["tower_status_dire"]       = match["tower_status_dire"]
          detailed_match["barracks_status_radiant"] = match["barracks_status_radiant"]
          detailed_match["barracks_status_dire"]    = match["barracks_status_dire"]
          detailed_match["cluster"]                 = match["cluster"]
          detailed_match["first_blood_time"]        = match["first_blood_time"]
          detailed_match["lobby_type"]              = match["lobby_type"]
          detailed_match["human_players"]           = match["human_players"]
          detailed_match["leagueid"]                = match["leagueid"]
          detailed_match["positive_votes"]          = match["positive_votes"]
          detailed_match["negative_votes"]          = match["negative_votes"]
          detailed_match["game_mode"]               = match["game_mode"]

          detailed_match["players"]                 = match["players"]

          # FIXME: untested, find a tournament return to make sure shape is correct
          detailed_match["picks_bans"]              = match["picks_bans"]

          puts "Saved Match ##{detailed_match["match_id"]}" if detailed_match.save!
        end
      end
      puts 'DONE.'

    rescue NoMethodError => e
      puts "Error fetching matches, is the API down?"
    end
  end

end

