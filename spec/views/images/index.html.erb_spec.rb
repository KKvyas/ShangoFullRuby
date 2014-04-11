require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :activity_id => 1,
        :location_id => 2,
        :feature_id => 3,
        :route_id => 4,
        :client_id => 5,
        :guide_id => 6,
        :trip_id => 7
      ),
      stub_model(Image,
        :activity_id => 1,
        :location_id => 2,
        :feature_id => 3,
        :route_id => 4,
        :client_id => 5,
        :guide_id => 6,
        :trip_id => 7
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
