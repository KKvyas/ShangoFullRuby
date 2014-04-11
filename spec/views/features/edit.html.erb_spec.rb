require 'spec_helper'

describe "features/edit" do
  before(:each) do
    @feature = assign(:feature, stub_model(Feature,
      :location_id => 1,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit feature form" do
    render

    assert_select "form[action=?][method=?]", feature_path(@feature), "post" do
      assert_select "input#feature_location_id[name=?]", "feature[location_id]"
      assert_select "input#feature_name[name=?]", "feature[name]"
      assert_select "textarea#feature_description[name=?]", "feature[description]"
    end
  end
end
