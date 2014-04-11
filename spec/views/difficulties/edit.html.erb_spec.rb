require 'spec_helper'

describe "difficulties/edit" do
  before(:each) do
    @difficulty = assign(:difficulty, stub_model(Difficulty,
      :description => "MyString"
    ))
  end

  it "renders the edit difficulty form" do
    render

    assert_select "form[action=?][method=?]", difficulty_path(@difficulty), "post" do
      assert_select "input#difficulty_description[name=?]", "difficulty[description]"
    end
  end
end
