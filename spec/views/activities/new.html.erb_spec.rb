require 'spec_helper'

describe "activities/new" do
  before(:each) do
    assign(:activity, stub_model(Activity,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do
      assert_select "input#activity_title[name=?]", "activity[title]"
      assert_select "textarea#activity_description[name=?]", "activity[description]"
    end
  end
end
