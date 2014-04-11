require 'spec_helper'

describe "lengths/edit" do
  before(:each) do
    @length = assign(:length, stub_model(Length,
      :description => "MyString"
    ))
  end

  it "renders the edit length form" do
    render

    assert_select "form[action=?][method=?]", length_path(@length), "post" do
      assert_select "input#length_description[name=?]", "length[description]"
    end
  end
end
