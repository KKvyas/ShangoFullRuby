require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "MyString",
      :hq_address => "MyString",
      :hq_city => "MyString",
      :hq_state => "MyString",
      :country => "MyString",
      :description => "MyText",
      :phone => "MyString",
      :email => "MyString",
      :owner_id => 1,
      :contact_name => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do
      assert_select "input#company_name[name=?]", "company[name]"
      assert_select "input#company_hq_address[name=?]", "company[hq_address]"
      assert_select "input#company_hq_city[name=?]", "company[hq_city]"
      assert_select "input#company_hq_state[name=?]", "company[hq_state]"
      assert_select "input#company_country[name=?]", "company[country]"
      assert_select "textarea#company_description[name=?]", "company[description]"
      assert_select "input#company_phone[name=?]", "company[phone]"
      assert_select "input#company_email[name=?]", "company[email]"
      assert_select "input#company_owner_id[name=?]", "company[owner_id]"
      assert_select "input#company_contact_name[name=?]", "company[contact_name]"
    end
  end
end
