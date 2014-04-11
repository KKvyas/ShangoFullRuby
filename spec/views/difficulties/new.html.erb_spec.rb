require 'spec_helper'

describe "difficulties/new" do
  before(:each) do
    assign(:difficulty, stub_model(Difficulty,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new difficulty form" do
    render

    assert_select "form[action=?][method=?]", difficulties_path, "post" do
      assert_select "input#difficulty_description[name=?]", "difficulty[description]"
    end
  end
end
