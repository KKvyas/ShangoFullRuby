require "spec_helper"

describe DifficultiesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/difficulties").to route_to("difficulties#index")
    end

    it "routes to #new" do
      expect(:get => "/difficulties/new").to route_to("difficulties#new")
    end

    it "routes to #show" do
      expect(:get => "/difficulties/1").to route_to("difficulties#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/difficulties/1/edit").to route_to("difficulties#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/difficulties").to route_to("difficulties#create")
    end

    it "routes to #update" do
      expect(:put => "/difficulties/1").to route_to("difficulties#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/difficulties/1").to route_to("difficulties#destroy", :id => "1")
    end

  end
end
