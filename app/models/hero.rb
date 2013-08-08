class Hero
  include Mongoid::Document

  field  :name,        type: String
  field  :str,         type: Integer
  field  :agi,         type: Integer
  field  :int,         type: Integer
  field  :str_per_lvl, type: Float
  field  :agi_per_lvl, type: Float
  field  :int_per_lvl, type: Float
  field  :hp,          type: Integer
  field  :mp,          type: Integer
  field  :min_dmg,     type: Integer
  field  :max_dmg,     type: Integer
  field  :armor,       type: Float

  validates :name, presence: true, uniqueness: true

  def self.get_hero_data
    hero_stats = []
    File.open('hero_stats/hero_search.txt', 'r').each_line do |line|
      hero_stats << line
    end
    puts hero_stats.class
  end

end