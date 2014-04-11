require 'spec_helper'

describe "Guides" do
  describe "GET /guides" do
    it "works! (now write some real specs)" do
      get guides_path
      expect(response.status).to be(200)
    end
  end
end
