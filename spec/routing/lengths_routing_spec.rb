require "spec_helper"

describe LengthsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lengths").to route_to("lengths#index")
    end

    it "routes to #new" do
      expect(:get => "/lengths/new").to route_to("lengths#new")
    end

    it "routes to #show" do
      expect(:get => "/lengths/1").to route_to("lengths#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lengths/1/edit").to route_to("lengths#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lengths").to route_to("lengths#create")
    end

    it "routes to #update" do
      expect(:put => "/lengths/1").to route_to("lengths#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lengths/1").to route_to("lengths#destroy", :id => "1")
    end

  end
end
