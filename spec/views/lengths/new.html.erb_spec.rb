require 'spec_helper'

describe "lengths/new" do
  before(:each) do
    assign(:length, stub_model(Length,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new length form" do
    render

    assert_select "form[action=?][method=?]", lengths_path, "post" do
      assert_select "input#length_description[name=?]", "length[description]"
    end
  end
end
