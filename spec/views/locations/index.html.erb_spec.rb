require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :description => "Description",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :agency_id => 1
      ),
      stub_model(Location,
        :description => "Description",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :agency_id => 1
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
