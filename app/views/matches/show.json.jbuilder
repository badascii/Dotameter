json.extract! @match,
  :id,
  :match_id,
  :radiant_win,
  :duration,
  :start_time,
  :match_seq_num,
  :tower_status_radiant,
  :tower_status_dire,
  :barracks_status_radiant,
  :barracks_status_dire,
  :cluster,
  :first_blood_time,
  :lobby_type,
  :human_players,
  :leagueid,
  :positive_votes,
  :negative_votes,
  :game_mode,

  :players,

  :picks_bans

json.url match_url(@match.match_id, format: :html)