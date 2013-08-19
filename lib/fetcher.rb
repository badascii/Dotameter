class HeroFetch

  def get_raw_hero_data
    File.read('hero_stats/hero_search.txt').each_line do |heroes|
      hero_stats = heroes
    end
    hero_stats
  end

  def json_data
    json_data ||= get_json_hero_data
  end

  def get_json_hero_data
    File.read('hero_stats/hero_search.json').each_line do |heroes|
      return JSON.parse(heroes)
    end
  end

  def get_icon(hero_name)
    hero = hero_name.downcase.gsub("-", "").gsub(" ", "_")
    "/assets/hero_portraits/#{hero}_full.png"
  end

  def build_heroes
    json_data.each do |hero|

      h = Hero.find_or_initialize_by(name: hero["name"])

      h.valve_id         = hero["valve_id"]
      h.radiant_team     = hero["radiant_team"]
      h.primary_stat     = hero["primary_stat"]
      h.str              = hero["str"].to_i
      h.agi              = hero["agi"].to_i
      h.int              = hero["int"].to_i
      h.str_per_lvl      = hero["str_per_lvl"].to_f
      h.agi_per_lvl      = hero["agi_per_lvl"].to_f
      h.int_per_lvl      = hero["int_per_lvl"].to_f
      h.hp               = hero["hp"].to_i
      h.mp               = hero["mp"].to_i
      h.min_dmg          = hero["min_dmg"].to_i
      h.max_dmg          = hero["max_dmg"].to_i
      h.armor            = hero["armor"].to_f
      h.move_speed       = hero["move_speed"]
      h.turn_rate        = hero["turn_rate"]
      h.day_sight        = hero["day_sight"]
      h.night_sight      = hero["night_sight"]
      h.attack_range     = hero["attack_range"]
      h.missile_speed    = hero["missile_speed"]
      h.front_swing      = hero["front_swing"]
      h.back_swing       = hero["back_swing"]
      h.front_cast_time  = hero["front_cast_time"]
      h.back_cast_time   = hero["back_cast_time"]
      h.base_attack_time = hero["base_attack_time"]
      h.icon             = get_icon(h.name)

      h.save!

      puts "Hero saved: #{h.name}" if h.save!
    end
  end

  def hero_win_rate(match_seq_num=215706101, limit=100)
    limit.times do
      match_seq_num += 1
      match = Match.find_by(match_seq_num: match_seq_num)
      unless match.nil?
        radiant_win = match.radiant_win
        set_wins_losses(match, radiant_win)
      end
    end
  end

  def set_wins_losses(match, radiant_win)
    match.players.each do |player|
      valve_id = player["hero_id"]
      team     = which_team(player["player_slot"])
      hero     = Hero.find_by(valve_id: valve_id)

      if ((team == "Radiant") && radiant_win) || ((team == "Dire") && !radiant_win)
        hero.wins += 1
        hero.save!
      else
        hero.losses += 1
        hero.save!
      end
    end
  end

  # 0-4 is Radiant, 128-132 is Dire
  def which_team(position)
    case position
    when (0..4)
      "Radiant"
    when (128..132)
      "Dire"
    end
  end

end # END OF HERO FETCH

class MatchFetch

  def last_match
    Match.last
  end

  def build_match(match, match_json)
    match.radiant_win             = match_json["radiant_win"]
    match.duration                = match_json["duration"]
    match.start_time              = match_json["start_time"]
    match.match_id                = match_json["match_id"]
    match.match_seq_num           = match_json["match_seq_num"]
    match.tower_status_radiant    = match_json["tower_status_radiant"]
    match.tower_status_dire       = match_json["tower_status_dire"]
    match.barracks_status_radiant = match_json["barracks_status_radiant"]
    match.barracks_status_dire    = match_json["barracks_status_dire"]
    match.cluster                 = match_json["cluster"]
    match.first_blood_time        = match_json["first_blood_time"]
    match.lobby_type              = match_json["lobby_type"]
    match.human_players           = match_json["human_players"]
    match.leagueid                = match_json["leagueid"]
    match.positive_votes          = match_json["positive_votes"]
    match.negative_votes          = match_json["negative_votes"]
    match.game_mode               = match_json["game_mode"]
    match.players                 = match_json["players"]

    # FIXME: untested, find a tournament return to make sure shape is correct
    match.picks_bans              = match_json["picks_bans"]

    match.save!

    puts "Match saved: Sequence ##{match.match_seq_num}" if match.save!
  end

  def get_matches
    first_release_match = 215_706_100

    # fetch according to initial release match number or last fetched
    last_fetched_seq = Match.last.match_seq_num.to_i unless Match.empty?
    last_fetched_seq ||= first_release_match

    begin
      returned_matches = DotaAPI.get_match_details_by_seq(last_fetched_seq + 1)["result"]
      returned_matches["matches"].each do |match_json|

        match = Match.find_or_initialize_by(match_id: match_json["match_id"].to_s)

        if match.new_record?
          build_match(match, match_json)
        end
      end
    rescue NoMethodError => e
      puts "Error fetching matches, is the API down?"
    end
  end

end

