require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :activity_id => 1,
      :location_id => 1,
      :feature_id => 1,
      :route_id => 1,
      :client_id => 1,
      :guide_id => 1,
      :trip_id => 1
    ).as_new_record)
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do
      assert_select "input#image_activity_id[name=?]", "image[activity_id]"
      assert_select "input#image_location_id[name=?]", "image[location_id]"
      assert_select "input#image_feature_id[name=?]", "image[feature_id]"
      assert_select "input#image_route_id[name=?]", "image[route_id]"
      assert_select "input#image_client_id[name=?]", "image[client_id]"
      assert_select "input#image_guide_id[name=?]", "image[guide_id]"
      assert_select "input#image_trip_id[name=?]", "image[trip_id]"
    end
  end
end
