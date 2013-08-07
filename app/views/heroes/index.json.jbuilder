json.array!(@heroes) do |hero|
  json.extract! hero, :id, :name
  json.url hero_url(hero, format: :json)
end
