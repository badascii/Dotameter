require 'spec_helper'

describe MatchesController do

  describe "GET 'index'" do

    it "returns http success" do
      get 'index'
      response.should be_success
    end

  end

  # TEMP:
  # it "returns empty array without param url" do
  #   post :find_by_url
  #   expect(response.body).to eq("[]")
  # end


end
