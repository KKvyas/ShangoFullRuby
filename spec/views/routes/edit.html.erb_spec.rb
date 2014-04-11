require 'spec_helper'

describe "routes/edit" do
  before(:each) do
    @route = assign(:route, stub_model(Route,
      :feature_id => 1,
      :name => "MyString",
      :description => "MyText",
      :rating => "MyString"
    ))
  end

  it "renders the edit route form" do
    render

    assert_select "form[action=?][method=?]", route_path(@route), "post" do
      assert_select "input#route_feature_id[name=?]", "route[feature_id]"
      assert_select "input#route_name[name=?]", "route[name]"
      assert_select "textarea#route_description[name=?]", "route[description]"
      assert_select "input#route_rating[name=?]", "route[rating]"
    end
  end
end
