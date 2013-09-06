class Hero
  include Mongoid::Document

  field :name,             type: String
  field :valve_id,         type: Integer
  field :wins,             type: Integer, default: 0
  field :losses,           type: Integer, default: 0
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
  field :icon,             type: String

  validates :name,         presence: true, uniqueness:   true
  validates :valve_id,     presence: true, uniqueness:   true
  validates :primary_stat, presence: true
  validates :str,          presence: true, numericality: true
  validates :agi,          presence: true, numericality: true
  validates :int,          presence: true, numericality: true

  # Returns an array of matches
  # def recent_matches
  #   recent = []
  #   matches = Match.find(:all, order: "match_seq_num desc", limit: 100)
  #   matches.each do |match|
  #     match.players.each do |player|
  #       if (player.valve_id == self.valve_id)
  #         recent << match
  #       end
  #     end
  #   end
  #   recent
  # end

end