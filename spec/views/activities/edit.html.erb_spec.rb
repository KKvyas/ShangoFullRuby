require 'spec_helper'

describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do
      assert_select "input#activity_title[name=?]", "activity[title]"
      assert_select "textarea#activity_description[name=?]", "activity[description]"
    end
  end
end
