require 'spec_helper'

describe "company_guides/new" do
  before(:each) do
    assign(:company_guide, stub_model(CompanyGuide,
      :company_id => 1,
      :guide_id => 1,
      :guide_confirmed => false,
      :company_confirmed => false
    ).as_new_record)
  end

  it "renders new company_guide form" do
    render

    assert_select "form[action=?][method=?]", company_guides_path, "post" do
      assert_select "input#company_guide_company_id[name=?]", "company_guide[company_id]"
      assert_select "input#company_guide_guide_id[name=?]", "company_guide[guide_id]"
      assert_select "input#company_guide_guide_confirmed[name=?]", "company_guide[guide_confirmed]"
      assert_select "input#company_guide_company_confirmed[name=?]", "company_guide[company_confirmed]"
    end
  end
end
