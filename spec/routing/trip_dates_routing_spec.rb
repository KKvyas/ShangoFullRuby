require "spec_helper"

describe TripDatesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trip_dates").to route_to("trip_dates#index")
    end

    it "routes to #new" do
      expect(:get => "/trip_dates/new").to route_to("trip_dates#new")
    end

    it "routes to #show" do
      expect(:get => "/trip_dates/1").to route_to("trip_dates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trip_dates/1/edit").to route_to("trip_dates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trip_dates").to route_to("trip_dates#create")
    end

    it "routes to #update" do
      expect(:put => "/trip_dates/1").to route_to("trip_dates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trip_dates/1").to route_to("trip_dates#destroy", :id => "1")
    end

  end
end
