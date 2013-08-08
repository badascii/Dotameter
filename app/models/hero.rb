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
  field :front_swing,      type: Float
  field :back_swing,       type: Float
  field :front_cast_time,  type: Float
  field :back_cast_time,   type: Float
  field :base_attack_time, type: Float

  validates :name, presence: true, uniqueness: true
  validates :str, presence: true, numericality: true
  validates :agi, presence: true, numericality: true
  validates :int, presence: true, numericality: true

  def self.get_hero_data
    hero_stats = []
    File.open('hero_stats/hero_search.txt', 'r').each_line do |heroes|
      hero_stats << heroes
    end
    hero_stats
  end

  def self.build_heroes
    heroes = Hero.get_hero_data
    heroes.each do |hero|
      Hero.create!(name: hero.keys.first,
                   radiant_team:     hero[:radiant_team],
                   primary_stat:     hero[:primary_stat],
                   str:              hero[:str],
                   agi:              hero[:agi],
                   int:              hero[:int],
                   str_per_lvl:      hero[:str_per_lvl],
                   agi_per_lvl:      hero[:agi_per_lvl],
                   int_per_lvl:      hero[:int_per_lvl],
                   hp:               hero[:hp],
                   mp:               hero[:mp],
                   min_dmg:          hero[:min_dmg],
                   max_dmg:          hero[:max_dmg],
                   armor:            hero[:armor],
                   move_speed:       hero[:move_speed],
                   turn_rate:        hero[:turn_rate],
                   day_sight:        hero[:day_sight],
                   night_sight:      hero[:night_sight],
                   attack_range:     hero[:attack_range],
                   front_swing:      hero[:front_swing],
                   back_swing:       hero[:back_swing],
                   front_cast_time:  hero[:front_cast_time],
                   back_cast_time:   hero[:back_cast_time],
                   base_attack_time: hero[:base_attack_time],
                   )
    end
  end

end