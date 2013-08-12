require 'rubygems'
require 'mechanize'
require 'open-uri'
require 'nokogiri'
require 'json'
require 'pp'

api_key = ENV["STEAM_API_KEY"]

@hero_list = JSON.parse(open("http://api.steampowered.com/IEconDOTA2_570/GetHeroes/v1/?key=#{api_key}").read)["result"]["heroes"].map { |hero| hero["name"].gsub(/npc_dota_hero_/, "") }
def hero_list_json
    f = File.open('hero_search.json', 'w')
      agent = Mechanize.new
      hero_array = []
      @hero_list.each do |hero|
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
        role = @page.parser.css('.biobox tr td')[4].text.chomp
        primary_stat = (@page.parser.css('p')[0].text.match(/Strength|Agility|Intelligence/i).to_s.downcase)
        if hero.include?('tinker')
            primary_stat = 'intelligence'
        elsif hero.include?('chen')
            primary_stat = "intelligence"
        end
        radiant_team = (@page.parser.css('.infobox tr th')[1].text.downcase.chomp.strip)
        if radiant_team == "the radiant"
            radiant_team = true
        else
            radiant_team = false
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
        hero = {    name: (@page.parser.css(".infobox tr th")[0].text).chomp.to_s.strip,
                    radiant_team: radiant_team,
                    primary_stat: primary_stat,
                    str: str.to_i,
                    agi: agi.to_i,
                    int: int.to_i,
                    str_per_lvl: str_per_lvl.to_f,
                    agi_per_lvl: agi_per_lvl.to_f,
                    int_per_lvl: int_per_lvl.to_f,
                    hp: (@page.parser.css(".infobox tr tr td")[1].text).chomp.strip.to_i,
                    mp: (@page.parser.css(".infobox tr tr td")[5].text).chomp.strip.to_i,
                    min_dmg: min_dmg.to_i,
                    max_dmg: max_dmg.to_i,
                    armor: (@page.parser.css(".infobox tr tr td")[13].text).chomp.strip.to_f,
                    move_speed: (@page.parser.css(".infobox tr tr td")[21].text).chomp.strip,
                    turn_rate: (@page.parser.css(".infobox tr tr td")[23].text).chomp.strip,
                    day_sight: day_sight,
                    night_sight: night_sight,
                    attack_range: (@page.parser.css(".infobox tr tr td")[27].text).chomp.strip,
                    missile_speed: (@page.parser.css(".infobox tr tr td")[29].text).chomp.strip,
                    front_swing: min_attack_duration_stats,
                    back_swing: max_attack_duration_stats,
                    front_cast_time: min_cast_duration_stats,
                    back_cast_time: max_cast_duration_stats,
                    base_attack_time: (@page.parser.css(".infobox tr tr td")[35].text).chomp.strip
                    }
            hero_array << hero
      end
    f << hero_array.to_json
    f.close
end
@hero_list_2 = JSON.parse(open("http://api.steampowered.com/IEconDOTA2_570/GetHeroes/v1/?key=#{api_key}").read)["result"]["heroes"].map { |hero| hero["name"].gsub(/npc_dota_hero_/, "") }
def hero_list_ruby
    f = File.open('hero_search.txt', 'w')
      agent = Mechanize.new
      hero_array = []
      @hero_list_2.each do |hero|
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
        hero = { (@page.parser.css(".infobox tr th")[0].text).chomp.to_s.strip => {
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
                    front_swing: min_attack_duration_stats,
                    back_swing: max_attack_duration_stats,
                    front_cast_time: min_cast_duration_stats,
                    back_cast_time: max_cast_duration_stats,
                    base_attack_time: (@page.parser.css(".infobox tr tr td")[35].text).chomp.strip
                    }}
            hero_array << hero
      end
    f << hero_array
    f.close
end

hero_list_json
# hero_list_ruby