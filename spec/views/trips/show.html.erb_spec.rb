require 'spec_helper'

describe "trips/show" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :activity_id => "Activity",
      :guide_id => 1,
      :difficulty_id => 2,
      :location_id => 3,
      :route_id => 4,
      :feature_id => 5,
      :latitude => "Latitude",
      :longitude => "Longitude",
      :required_gear => "MyText",
      :supplied_gear => "MyText",
      :special_directions => "MyText",
      :offer_capacity => 6,
      :trip_length_id => 1,
      :description => "MyText",
      :itinerary => "MyText"
    ))
  end


end
