json.array!(@heroes) do |hero|
  # FIXME: where the hell is the ID?!!
  json.extract! hero, :id,
                      :valve_id,
                      :name,
                      :radiant_team,
                      :primary_stat,
                      :str,
                      :agi,
                      :int,
                      :str_per_lvl,
                      :agi_per_lvl,
                      :int_per_lvl,
                      :hp,
                      :mp,
                      :min_dmg,
                      :max_dmg,
                      :armor,
                      :move_speed,
                      :turn_rate,
                      :day_sight,
                      :night_sight,
                      :attack_range,
                      :missile_speed,
                      :front_swing,
                      :back_swing,
                      :front_cast_time,
                      :back_cast_time,
                      :base_attack_time,
                      :icon
  json.url hero_url(hero, format: :html)
end






