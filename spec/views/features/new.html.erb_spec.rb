require 'spec_helper'

describe "features/new" do
  before(:each) do
    assign(:feature, stub_model(Feature,
      :location_id => 1,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new feature form" do
    render

    assert_select "form[action=?][method=?]", features_path, "post" do
      assert_select "input#feature_location_id[name=?]", "feature[location_id]"
      assert_select "input#feature_name[name=?]", "feature[name]"
      assert_select "textarea#feature_description[name=?]", "feature[description]"
    end
  end
end
