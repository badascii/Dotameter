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
  # I Stole this from active record...
  # http://apidock.com/rails/Array/in_groups_of
  #
  #
  #{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
  # File activesupport/lib/active_support/core_ext/array/grouping.rb, line 19
  def in_groups_of(number, fill_with = nil)
    if fill_with == false
      collection = self
    else
      # size % number gives how many extra we have;
      # subtracting from number gives how many to add;
      # modulo number ensures we don't add group of just fill.
      padding = (number - size % number) % number
      collection = dup.concat([fill_with] * padding)
    end

    if block_given?
      collection.each_slice(number) { |slice| yield(slice) }
    else
      groups = []
      collection.each_slice(number) { |group| groups << group }
      groups
    end
  end


  # Returns a nice array of node objects from the Mongo DB for Heros.
  # Looks like = [{'y' => height_of_node, 'runningSum' => num_games_won, 'runningTotal' => num_games_tot}]
  def self.hero_win_graph(hero_id, groups_of)
    # if groups_of == false
    #   match_groups = 0
    # end
    matches = Match.all
    runningSum = 0
    runningTotal = 0
    winPercent = 0.00
    histogram = []
    matches.in_groups_of(groups_of).each do |batch|
      batch.each do |match|
        # somewhere here this will need to be built in batches
        # get the winning team/
        winningTeam = if match.radiant_win == true then 'Radiant' else 'Dire' end
        # Loop through all the players in that match looking for heroes that match the hero passed.
        match.players.each do |player|
          # if the hero in the match is the hero we are looking for
          if (player['hero_id'] == hero_id)
            # check if this player was on the winning team
            playerTeam = DB.which_team(player['player_slot'])
            if (playerTeam == winningTeam)
              # add one to the running sum
              runningSum += 1
            end
            # add one to the running total
            runningTotal += 1
          end
        end
        # calculate the win %
        winPercent = runningSum.to_f / runningTotal.to_f
        # push it onto the histogram array
        histogram.push({'y' => winPercent, 'totMatches' => runningTotal, 'totWins' => runningSum})
      end
    end
    return histogram
  end

end