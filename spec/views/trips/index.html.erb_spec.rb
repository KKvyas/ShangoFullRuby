require 'spec_helper'

describe "trips/index" do
  before(:each) do
    assign(:trips, [
      stub_model(Trip,
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
        :trip_length_id => 7,
        :description => "MyText",
        :itinerary => "MyText"
      ),
      stub_model(Trip,
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
        :trip_length_id => 7,
        :description => "MyText",
        :itinerary => "MyText"
      )
    ])
  end

end
