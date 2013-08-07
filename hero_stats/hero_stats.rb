require 'rubygems'
require 'mechanize'
require 'open-uri'
require 'nokogiri'
require 'json'
require 'pp'

hero_list = JSON.parse(open('http://api.steampowered.com/IEconDOTA2_570/GetHeroes/v1/?key=STEAM_API_KEY').read)["result"]["heroes"].map { |hero| hero["name"].gsub(/npc_dota_hero_/, "") }
f = File.open('hero_search.json', 'w')
  agent = Mechanize.new
  hero_list.each do |hero|
    if hero.include?('_')
      hero = hero.split('_').each {|word| word.capitalize! }
      hero = hero.join('_')
      @page = agent.get("http://dota2.gamepedia.com/#{hero}")
    elsif hero.include?('spirit')
      hero = hero.replace("Vengeful_Spirit")
      @page = agent.get("http://dota2.gamepedia.com/#{hero}")
    elsif hero.include?('pain')
      hero = hero.replace("Queen_of_Pain")
      @page = agent.get("http://dota2.gamepedia.com/#{hero}")
    else
      @page = agent.get("http://dota2.gamepedia.com/#{hero.capitalize}")
    end
    str_stats = (@page.parser.css(".infobox tr th")[2].text).chomp.split('+')
    str = str_stats[0].strip
    str_per_lvl = str_stats[1].strip
    agi_stats = (@page.parser.css(".infobox tr th")[3].text).chomp.split('+')
    agi = agi_stats[0].strip
    agi_per_lvl = str_stats[1].strip
    int_stats = (@page.parser.css(".infobox tr th")[4].text).chomp.split('+')
    int = int_stats[0].strip
    int_per_lvl = int_stats[1].strip
    dmg_stats = (@page.parser.css(".infobox tr tr td")[9].text).chomp.split('-')
    min_dmg = dmg_stats[0].strip
    max_dmg = dmg_stats[1].strip
    sight_stats = (@page.parser.css(".infobox tr tr td")[25].text).chomp.split('/')
    day_sight = sight_stats[0].strip
    night_sight = sight_stats[1].strip
    attack_duration_stats = (@page.parser.css(".infobox tr tr td")[31].text).chomp.split('+')
    min_attack_duration_stats = attack_duration_stats[0].strip
    max_attack_duration_stats = attack_duration_stats[1].strip
    cast_duration_stats = (@page.parser.css(".infobox tr tr td")[33].text).chomp.split('+')
    min_cast_duration_stats = cast_duration_stats[0].strip
    max_cast_duration_stats = cast_duration_stats[1].strip
    # infobox = {}
    infobox = { (@page.parser.css(".infobox tr th")[0].text).chomp.to_s.strip => {
                str: str,
                agi: agi,
                int: int,
                str_per_lvl: str_per_lvl,
                agi_per_lvl: agi_per_lvl,
                int_per_lvl: int_per_lvl,
                hp: (@page.parser.css(".infobox tr tr td")[1].text).chomp.strip,
                mp: (@page.parser.css(".infobox tr tr td")[5].text).chomp.strip,
                min_dmg: min_dmg,
                max_dmg: max_dmg,
                armor: (@page.parser.css(".infobox tr tr td")[13].text).chomp.strip,
                move_speed: (@page.parser.css(".infobox tr tr td")[21].text).chomp.strip,
                turn_rate: (@page.parser.css(".infobox tr tr td")[23].text).chomp.strip,
                day_sight: day_sight,
                night_sight: night_sight,
                attack_range: (@page.parser.css(".infobox tr tr td")[27].text).chomp.strip,
                missile_speed: (@page.parser.css(".infobox tr tr td")[29].text).chomp.strip,
                min_attack_duration_stats: min_attack_duration_stats,
                max_attack_duration_stats: max_attack_duration_stats,
                min_cast_duration_stats: min_cast_duration_stats,
                max_cast_duration_stats: max_cast_duration_stats,
                base_attack_time: (@page.parser.css(".infobox tr tr td")[35].text).chomp.strip
                }}
    f << infobox
  end
f.close