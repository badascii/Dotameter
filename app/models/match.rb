class Match
  include Mongoid::Document

  field :radiant_win,             type: Boolean
  field :duration,                type: Integer
  field :start_time,              type: DateTime
  field :match_id,                type: String
  field :match_seq_num,           type: Integer
  field :tower_status_radiant,    type: Integer
  field :tower_status_dire,       type: Integer
  field :barracks_status_radiant, type: Integer
  field :barracks_status_dire,    type: Integer
  field :cluster,                 type: Integer
  field :first_blood_time,        type: Integer
  field :lobby_type,              type: Integer
  field :human_players,           type: Integer
  field :leagueid,                type: Integer
  field :positive_votes,          type: Integer
  field :negative_votes,          type: Integer
  field :game_mode,               type: Integer

  field :players,                 type: Array

  field :picks_bans,              type: Array

  validates :match_id, presence: true, uniqueness: true


  def self.hero_win_rate(match_seq_num=215706101, limit=100)

    limit.times do
      match_seq_num += 1
      match = Match.find_by(match_seq_num: match_seq_num)
      unless match.nil?
        radiant_win = match.radiant_win

        match.players.each do |player|
          valve_id = player["hero_id"]
          team     = Match.which_team(player["player_slot"])
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
    end
  end

  # def self.win_loss_hash
  #   win_loss_count = {}

  #   heroes = Hero.all
  #     heroes.each do |hero|
  #       hero_hash           = {}
  #       hero_hash["wins"]   = 0
  #       hero_hash["losses"] = 0
  #       win_loss_count[hero.valve_id] = hero_hash
  #   end
  #   win_loss_count
  # end

  # 0-4 is Radiant, 128-132 is Dire
  def self.which_team(position)
    case position
    when 0, 1, 2, 3, 4
      "Radiant"
    when 128, 129, 130, 131, 132
      "Dire"
    end
  end

end
