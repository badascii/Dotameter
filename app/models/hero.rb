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
  field :back_swing,       type: FLoat
  field :front_cast_time,  type: Float
  field :back_cast_time    type: Float
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

end