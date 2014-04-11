require 'spec_helper'

describe "routes/index" do
  before(:each) do
    assign(:routes, [
      stub_model(Route,
        :feature_id => 1,
        :name => "Name",
        :description => "MyText",
        :rating => "Rating"
      ),
      stub_model(Route,
        :feature_id => 1,
        :name => "Name",
        :description => "MyText",
        :rating => "Rating"
      )
    ])
  end

  it "renders a list of routes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Rating".to_s, :count => 2
  end
end
