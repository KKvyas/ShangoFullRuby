require 'spec_helper'

describe "company_guides/index" do
  before(:each) do
    assign(:company_guides, [
      stub_model(CompanyGuide,
        :company_id => 1,
        :guide_id => 2,
        :guide_confirmed => false,
        :company_confirmed => false
      ),
      stub_model(CompanyGuide,
        :company_id => 1,
        :guide_id => 2,
        :guide_confirmed => false,
        :company_confirmed => false
      )
    ])
  end

  it "renders a list of company_guides" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
