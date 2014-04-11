require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :name => "Name",
        :hq_address => "Hq Address",
        :hq_city => "Hq City",
        :hq_state => "Hq State",
        :country => "Country",
        :description => "MyText",
        :phone => "Phone",
        :email => "Email",
        :owner_id => 1,
        :contact_name => "Contact Name"
      ),
      stub_model(Company,
        :name => "Name",
        :hq_address => "Hq Address",
        :hq_city => "Hq City",
        :hq_state => "Hq State",
        :country => "Country",
        :description => "MyText",
        :phone => "Phone",
        :email => "Email",
        :owner_id => 1,
        :contact_name => "Contact Name"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Hq Address".to_s, :count => 2
    assert_select "tr>td", :text => "Hq City".to_s, :count => 2
    assert_select "tr>td", :text => "Hq State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
  end
end
