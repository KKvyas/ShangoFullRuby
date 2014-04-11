require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :description => "MyString",
      :latitude => "MyString",
      :longitude => "MyString",
      :agency_id => 1
    ).as_new_record)
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do
      assert_select "input#location_description[name=?]", "location[description]"
      assert_select "input#location_latitude[name=?]", "location[latitude]"
      assert_select "input#location_longitude[name=?]", "location[longitude]"
      assert_select "input#location_agency_id[name=?]", "location[agency_id]"
    end
  end
end
