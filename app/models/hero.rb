class Hero
  include Mongoid::Document

  field :name,             type: String
  field :radiant_team,     type: Boolean
  field :primary_stat,     type: String
  field :str,              type: Integer
  field :agi,              type: Integer
  field :int,              type: Integer
  field :str_per_lvl,      type: Float
  field :agi_per_lvl,      type: Float
  field :int_per_lvl,      type: Float
  field :hp,               type: Integer
  field :mp,               type: Integer
  field :min_dmg,          type: Integer
  field :max_dmg,          type: Integer
  field :armor,            type: Float
  field :move_speed,       type: Integer
  field :turn_rate,        type: Float
  field :day_sight,        type: Integer
  field :night_sight,      type: Integer
  field :attack_range,     type: String
  field :missle_speed,     type: String
  field :front_swing,      type: Float
  field :back_swing,       type: Float
  field :front_cast_time,  type: Float
  field :back_cast_time,   type: Float
  field :base_attack_time, type: Float

  validates :name, presence: true, uniqueness: true
  validates :str, presence: true, numericality: true
  validates :agi, presence: true, numericality: true
  validates :int, presence: true, numericality: true

  def self.get_raw_hero_data
    File.read('hero_stats/hero_search.txt').each_line do |heroes|
      hero_stats = heroes
    end
    hero_stats
  end

def self.get_json_hero_data
  # returns parsed json
end


  def self.build_heroes
    heroes = Hero.get_json_hero_data
    heroes.each do |hero|
      puts hero
      puts hero.class
      puts hero.first
      Hero.create!(name: hero.keys.first,
                   radiant_team:     hero.first[:radiant_team],
                   primary_stat:     hero.first[:primary_stat],
                   str:              hero.first[:str],
                   agi:              hero.first[:agi],
                   int:              hero.first[:int],
                   str_per_lvl:      hero.first[:str_per_lvl],
                   agi_per_lvl:      hero.first[:agi_per_lvl],
                   int_per_lvl:      hero.first[:int_per_lvl],
                   hp:               hero.first[:hp],
                   mp:               hero.first[:mp],
                   min_dmg:          hero.first[:min_dmg],
                   max_dmg:          hero.first[:max_dmg],
                   armor:            hero.first[:armor],
                   move_speed:       hero.first[:move_speed],
                   turn_rate:        hero.first[:turn_rate],
                   day_sight:        hero.first[:day_sight],
                   night_sight:      hero.first[:night_sight],
                   attack_range:     hero.first[:attack_range],
                   front_swing:      hero.first[:front_swing],
                   back_swing:       hero.first[:back_swing],
                   front_cast_time:  hero.first[:front_cast_time],
                   back_cast_time:   hero.first[:back_cast_time],
                   base_attack_time: hero.first[:base_attack_time],
                   )
    end
  end

end