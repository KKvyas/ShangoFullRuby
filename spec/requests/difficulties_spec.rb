require 'spec_helper'

describe "Difficulties" do
  describe "GET /difficulties" do
    it "works! (now write some real specs)" do
      get difficulties_path
      expect(response.status).to be(200)
    end
  end
end
