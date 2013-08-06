#----------------------------------------------------------------------
# single line players
#----------------------------------------------------------------------

            "players" : [{"account_id" : 4294967295, "player_slot" : 3, "hero_id" : 77, "item_0" : 143, "item_1" : 81, "item_2" : 63, "item_3" : 9, "item_4" : 4, "item_5" : 0, "kills" : 9, "deaths" : 12, "assists" : 7, "leaver_status" : 0, "gold" : 3330, "last_hits" : 82, "denies" : 2, "gold_per_min" : 309, "xp_per_min" : 500, "gold_spent" : 9170, "hero_damage" : 9723, "tower_damage" : 2882, "hero_healing" : 852, "level" : 21, "ability_upgrades" : [{"ability" : 5397, "time" : 208, "level" : 1 }, {"ability" : 5396, "time" : 316, "level" : 2 } ] }, {"account_id" : 4294967295, "player_slot" : 4, "hero_id" : 34, "item_0" : 36, "item_1" : 48, "item_2" : 178, "item_3" : 57, "item_4" : 24, "item_5" : 60, "kills" : 5, "deaths" : 10, "assists" : 20, "leaver_status" : 0, "gold" : 448, "last_hits" : 77, "denies" : 2, "gold_per_min" : 278, "xp_per_min" : 463, "gold_spent" : 8024, "hero_damage" : 15721, "tower_damage" : 416, "hero_healing" : 0, "level" : 20, "ability_upgrades" : [{"ability" : 5150, "time" : 176, "level" : 1 }, {"ability" : 5151, "time" : 287, "level" : 2 }, {"ability" : 5152, "time" : 341, "level" : 3 } ] } ]



#----------------------------------------------------------------------
# semi-full, player count shortened to 2
#----------------------------------------------------------------------

{
      "players" : [
                        {
                  "account_id" : 4294967295,
                 "player_slot" : 3,
                     "hero_id" : 77,
                      "item_0" : 143,
                      "item_1" : 81,
                      "item_2" : 63,
                      "item_3" : 9,
                      "item_4" : 4,
                      "item_5" : 0,
                       "kills" : 9,
                      "deaths" : 12,
                     "assists" : 7,
               "leaver_status" : 0,
                        "gold" : 3330,
                   "last_hits" : 82,
                      "denies" : 2,
                "gold_per_min" : 309,
                  "xp_per_min" : 500,
                  "gold_spent" : 9170,
                 "hero_damage" : 9723,
                "tower_damage" : 2882,
                "hero_healing" : 852,
                       "level" : 21,
            "ability_upgrades" : [
              {
                "ability" : 5397,
                   "time" : 208,
                  "level" : 1
              },
              {
                "ability" : 5396,
                   "time" : 316,
                  "level" : 2
              }
            ]
          },
            {
                  "account_id" : 4294967295,
                 "player_slot" : 4,
                     "hero_id" : 34,
                      "item_0" : 36,
                      "item_1" : 48,
                      "item_2" : 178,
                      "item_3" : 57,
                      "item_4" : 24,
                      "item_5" : 60,
                       "kills" : 5,
                      "deaths" : 10,
                     "assists" : 20,
               "leaver_status" : 0,
                        "gold" : 448,
                   "last_hits" : 77,
                      "denies" : 2,
                "gold_per_min" : 278,
                  "xp_per_min" : 463,
                  "gold_spent" : 8024,
                 "hero_damage" : 15721,
                "tower_damage" : 416,
                "hero_healing" : 0,
                       "level" : 20,
            "ability_upgrades" : [
              {
                "ability" : 5150,
                   "time" : 176,
                  "level" : 1
              },
              {
                "ability" : 5151,
                   "time" : 287,
                  "level" : 2
              },
              {
                "ability" : 5152,
                   "time" : 341,
                  "level" : 3
              }
            ]
          }
                    ],
              "radiant_win" : false,
                 "duration" : 2948,
               "start_time" : 1363784346,
                 "match_id" : 153207783,
            "match_seq_num" : 139500000,
     "tower_status_radiant" : 4,
        "tower_status_dire" : 260,
  "barracks_status_radiant" : 3,
     "barracks_status_dire" : 51,
                  "cluster" : 182,
         "first_blood_time" : 140,
               "lobby_type" : 0,
            "human_players" : 10,
                 "leagueid" : 0,
           "positive_votes" : 0,
           "negative_votes" : 0,
                "game_mode" : 4
      }

#---


# 2013-08-05T09:36:55+00:00
# puts DateTime.strptime(DotaAPI.get_match_details_by_seq(239_500_000)["result"]["matches"][0]["start_time"].to_s,'%s')

# 2013-07-15T07:01:53+00:00
# puts DateTime.strptime(DotaAPI.get_match_details_by_seq(220_500_000)["result"]["matches"][0]["start_time"].to_s,'%s')

# 2013-07-09T11:37:37+00:00
# puts DateTime.strptime(DotaAPI.get_match_details_by_seq(216_000_000)["result"]["matches"][0]["start_time"].to_s,'%s')

# APPROX INCEPTION OF BETA
# puts DateTime.strptime(DotaAPI.get_match_details_by_seq(215_706_100)["result"]["matches"][0]["start_time"].to_s,'%s')


# 2013-07-08T17:12:48+00:00
# puts DateTime.strptime(DotaAPI.get_match_details_by_seq(215_500_000)["result"]["matches"][0]["start_time"].to_s,'%s')

# 2013-03-20T12:59:06+00:00
# puts DateTime.strptime(DotaAPI.get_match_details_by_seq(139_500_000)["result"]["matches"][0]["start_time"].to_s,'%s')
