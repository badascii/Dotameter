require 'spec_helper'

describe "Matches" do

  describe "GET matches" do

    it "lands on the match#index successfully" do
      get '/matches'
      expect(response.status).to be(200)
    end

    # it "lands on the about page successfully" do
    #   get 'matches/about'
    #   expect(response.status).to be(200)
    # end

    # it "disallows access to submit without query param" do
    #   expect{
    #     get 'matches/submit'
    #   }.to raise_error()
    # end

   end
end
