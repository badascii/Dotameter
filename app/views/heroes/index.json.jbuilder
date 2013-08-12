json.array!(@heroes) do |hero|
  # FIXME: where the hell is the ID?!!
  json.extract! hero, :id, :name, :agi, :attack_range, :armor
  json.url hero_url(hero)
end
