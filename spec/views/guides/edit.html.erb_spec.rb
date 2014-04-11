require 'spec_helper'

describe "guides/edit" do
  before(:each) do
    @guide = assign(:guide, stub_model(Guide,
      :user_id => "MyString",
      :intro => "MyString",
      :bio => "MyString",
      :approved => false,
      :banned => false
    ))
  end

  it "renders the edit guide form" do
    render

    assert_select "form[action=?][method=?]", guide_path(@guide), "post" do
      assert_select "input#guide_user_id[name=?]", "guide[user_id]"
      assert_select "input#guide_intro[name=?]", "guide[intro]"
      assert_select "input#guide_bio[name=?]", "guide[bio]"
      assert_select "input#guide_approved[name=?]", "guide[approved]"
      assert_select "input#guide_banned[name=?]", "guide[banned]"
    end
  end
end
