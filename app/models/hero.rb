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
  field :move_speed,       type: String
  field :turn_rate,        type: String
  field :day_sight,        type: String
  field :night_sight,      type: String
  field :attack_range,     type: String
  field :missile_speed,    type: String
  field :front_swing,      type: String
  field :back_swing,       type: String
  field :front_cast_time,  type: String
  field :back_cast_time,   type: String
  field :base_attack_time, type: String

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
    File.read('hero_stats/hero_search.json').each_line do |heroes|
      return JSON.parse(heroes)
    end
  end


  def self.build_heroes
    heroes = Hero.get_json_hero_data
    heroes.each do |hero|

      h = Hero.find_or_initialize_by(name: hero["name"])

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

      h.save!
    end
  end

end