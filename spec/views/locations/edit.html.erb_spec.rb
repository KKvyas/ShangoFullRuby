require 'spec_helper'

describe "locations/edit" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :description => "MyString",
      :latitude => "MyString",
      :longitude => "MyString",
      :agency_id => 1
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do
      assert_select "input#location_description[name=?]", "location[description]"
      assert_select "input#location_latitude[name=?]", "location[latitude]"
      assert_select "input#location_longitude[name=?]", "location[longitude]"
      assert_select "input#location_agency_id[name=?]", "location[agency_id]"
    end
  end
end
