json.array!(@matches) do |match|
  json.extract! match, :id, :match_id
end
