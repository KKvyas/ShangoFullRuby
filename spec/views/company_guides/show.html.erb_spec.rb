require 'spec_helper'

describe "company_guides/show" do
  before(:each) do
    @company_guide = assign(:company_guide, stub_model(CompanyGuide,
      :company_id => 1,
      :guide_id => 2,
      :guide_confirmed => false,
      :company_confirmed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
