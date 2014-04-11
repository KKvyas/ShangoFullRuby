require 'spec_helper'

describe "images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :activity_id => 1,
      :location_id => 1,
      :feature_id => 1,
      :route_id => 1,
      :client_id => 1,
      :guide_id => 1,
      :trip_id => 1
    ))
  end
end
