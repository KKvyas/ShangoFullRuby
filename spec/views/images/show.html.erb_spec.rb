require 'spec_helper'

describe "images/show" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :activity_id => 1,
      :location_id => 2,
      :feature_id => 3,
      :route_id => 4,
      :client_id => 5,
      :guide_id => 6,
      :trip_id => 7
    ))
  end

end
