require 'spec_helper'

describe "features/index" do
  before(:each) do
    assign(:features, [
      stub_model(Feature,
        :location_id => 1,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Feature,
        :location_id => 1,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of features" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
