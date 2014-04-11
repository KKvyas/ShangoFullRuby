require 'spec_helper'

describe "routes/new" do
  before(:each) do
    assign(:route, stub_model(Route,
      :feature_id => 1,
      :name => "MyString",
      :description => "MyText",
      :rating => "MyString"
    ).as_new_record)
  end

  it "renders new route form" do
    render

    assert_select "form[action=?][method=?]", routes_path, "post" do
      assert_select "input#route_feature_id[name=?]", "route[feature_id]"
      assert_select "input#route_name[name=?]", "route[name]"
      assert_select "textarea#route_description[name=?]", "route[description]"
      assert_select "input#route_rating[name=?]", "route[rating]"
    end
  end
end
