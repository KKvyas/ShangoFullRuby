require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :description => "Description",
      :latitude => "Latitude",
      :longitude => "Longitude",
      :agency_id => 1
    ))
  end

end
