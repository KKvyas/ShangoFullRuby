require 'spec_helper'

describe "guides/new" do
  before(:each) do
    assign(:guide, stub_model(Guide,
      :user_id => "MyString",
      :intro => "MyString",
      :bio => "MyString",
      :approved => false,
      :banned => false
    ).as_new_record)
  end

  it "renders new guide form" do
    render

    assert_select "form[action=?][method=?]", guides_path, "post" do
      assert_select "input#guide_user_id[name=?]", "guide[user_id]"
      assert_select "input#guide_intro[name=?]", "guide[intro]"
      assert_select "input#guide_bio[name=?]", "guide[bio]"
      assert_select "input#guide_approved[name=?]", "guide[approved]"
      assert_select "input#guide_banned[name=?]", "guide[banned]"
    end
  end
end
