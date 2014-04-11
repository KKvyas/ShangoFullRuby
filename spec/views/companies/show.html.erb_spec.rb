require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
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
    ))
  end

end
