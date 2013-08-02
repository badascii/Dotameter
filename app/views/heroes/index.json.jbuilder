json.array!(@heroes) do |hero|
  json.extract! hero, :name, :valve_id
  json.url hero_url(hero, format: :json)
end
