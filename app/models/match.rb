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


  #{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
  #
  #
  # Returns a nice array of node objects from the Mongo DB for Heros.
  # Looks like = [{'y' => height_of_node, 'runningSum' => num_games_won, 'runningTotal' => num_games_tot}]
  # We are using this to build the fancy win % graph on the heroes show page
  #
  #
  #{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
  def self.hero_win_graph(hero_id, groups_of = 1)
    # Get all matches ever from database
    # FIXME: This should have a better SQL method to try and return only the records we need.
    data = Match.all

    matches = data.in_groups_of(groups_of)

    # Initialize local variables
    running_sum = 0
    running_total = 0
    win_percent = 0.00
    histogram = []

    matches.each do |batch|
      batch.each do |match|
        # somewhere here this will need to be built in batches
        # get the winning team/
        winning_team = if match.radiant_win == true then 'Radiant' else 'Dire' end
        # Loop through all the players in that match looking for heroes that match the hero passed.
        match.players.each do |player|
          # if the hero in the match is the hero we are looking for
          if (player['hero_id'] == hero_id)
            # check if this player was on the winning team
            player_team = DB.which_team(player['player_slot'])
            if (player_team == winning_team)
              # add one to the running sum
              running_sum += 1
            end
            # add one to the running total
            running_total += 1
          end
        end
        # calculate the win %
        win_percent = running_sum.to_f / running_total.to_f
        # push it onto the histogram array
        histogram.push({'y' => win_percent, 'totMatches' => running_total, 'totWins' => running_sum, 'winningTeam' => winning_team})
      end
    end

    # Explicitly return the work
    return histogram
  end

end