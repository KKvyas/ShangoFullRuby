require 'spec_helper'

describe "company_guides/edit" do
  before(:each) do
    @company_guide = assign(:company_guide, stub_model(CompanyGuide,
      :company_id => 1,
      :guide_id => 1,
      :guide_confirmed => false,
      :company_confirmed => false
    ))
  end

  it "renders the edit company_guide form" do
    render

    assert_select "form[action=?][method=?]", company_guide_path(@company_guide), "post" do
      assert_select "input#company_guide_company_id[name=?]", "company_guide[company_id]"
      assert_select "input#company_guide_guide_id[name=?]", "company_guide[guide_id]"
      assert_select "input#company_guide_guide_confirmed[name=?]", "company_guide[guide_confirmed]"
      assert_select "input#company_guide_company_confirmed[name=?]", "company_guide[company_confirmed]"
    end
  end
end
