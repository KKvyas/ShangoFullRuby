require 'spec_helper'

describe "trips/edit" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :activity_id => "MyString",
      :guide_id => 1,
      :difficulty_id => 1,
      :location_id => 1,
      :route_id => 1,
      :feature_id => 1,
      :latitude => "MyString",
      :longitude => "MyString",
      :required_gear => "MyText",
      :supplied_gear => "MyText",
      :special_directions => "MyText",
      :offer_capacity => 1,
      :trip_length_id => 1,
      :description => "MyText",
      :itinerary => "MyText"
    ))
  end

  it "renders the edit trip form" do
    render

    assert_select "form[action=?][method=?]", trip_path(@trip), "post" do
      assert_select "input#trip_activity_id[name=?]", "trip[activity_id]"
      assert_select "input#trip_guide_id[name=?]", "trip[guide_id]"
      assert_select "input#trip_difficulty_id[name=?]", "trip[difficulty_id]"
      assert_select "input#trip_location_id[name=?]", "trip[location_id]"
      assert_select "input#trip_route_id[name=?]", "trip[route_id]"
      assert_select "input#trip_feature_id[name=?]", "trip[feature_id]"
      assert_select "input#trip_latitude[name=?]", "trip[latitude]"
      assert_select "input#trip_longitude[name=?]", "trip[longitude]"
      assert_select "textarea#trip_required_gear[name=?]", "trip[required_gear]"
      assert_select "textarea#trip_supplied_gear[name=?]", "trip[supplied_gear]"
      assert_select "textarea#trip_special_directions[name=?]", "trip[special_directions]"
      assert_select "input#trip_offer_capacity[name=?]", "trip[offer_capacity]"
      assert_select "input#trip_trip_length_id[name=?]", "trip[trip_length_id]"
      assert_select "textarea#trip_description[name=?]", "trip[description]"
      assert_select "textarea#trip_itinerary[name=?]", "trip[itinerary]"
    end
  end
end
