require 'spec_helper'

describe "lengths/index" do
  before(:each) do
    assign(:lengths, [
      stub_model(Length,
        :description => "Description"
      ),
      stub_model(Length,
        :description => "Description"
      )
    ])
  end

  it "renders a list of lengths" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
