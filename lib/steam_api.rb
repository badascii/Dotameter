class SteamAPI
  def self.get_response(uri)
    HTTParty.get(uri)
  end

  def self.base_uri
    "http://api.steampowered.com/"
  end

  def self.version
    "/v1"
  end

  def self.api_key
    "/?key=" + ENV["STEAM_API_KEY"]
  end
end

class DotaAPI < SteamAPI
  def self.dota_base_uri
    DotaAPI.base_uri + "IDOTA2Match_570/"
  end

  def self.dota_econ_base_uri
    DotaAPI.base_uri + "IEconDOTA2_570/"
  end

  # def self.get_valve_hero_ids
  #   uri = DotaAPI.dota_econ_base_uri + "GetHeroes" + DotaAPI.version + DotaAPI.api_key
  #   response = DotaAPI.get_response(uri)
  #   hero_array = response["result"]["heroes"]
  #   hero_hash = {}

  #   hero_array.each do |hero|
  #     name = hero["name"].gsub("npc_dota_hero_", "").gsub("_", " ").titleize
  #     hero_hash[name] = hero["id"]
  #   end
  #   hero_hash
  # end

  def self.get_match_history
    uri = DotaAPI.dota_base_uri + "GetMatchHistory" + DotaAPI.version + DotaAPI.api_key
    DotaAPI.get_response(uri)
  end

  def self.get_match_details(match_id)
    uri = DotaAPI.dota_base_uri + "GetMatchDetails" + DotaAPI.version + DotaAPI.api_key + "&match_id=" + match_id
    DotaAPI.get_response(uri)
  end

  def self.get_match_details_by_seq(seq_start=0)
    uri = DotaAPI.dota_base_uri + "GetMatchHistoryBySequenceNum" + DotaAPI.version + DotaAPI.api_key + "&start_at_match_seq_num=" + seq_start.to_s
    DotaAPI.get_response(uri)
  end
end

class UserAPI < SteamAPI
end