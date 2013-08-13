require 'spec_helper'

describe "Heroes" do

  describe "GET heroes" do

    it "lands on the homepage successfully" do
      get '/'
      expect(response.status).to be(200)
    end

    # it "lands on the about page successfully" do
    #   get 'heroes/about'
    #   expect(response.status).to be(200)
    # end

    # it "disallows access to submit without query param" do
    #   expect{
    #     get 'heroes/submit'
    #   }.to raise_error()
    # end

   end
end
