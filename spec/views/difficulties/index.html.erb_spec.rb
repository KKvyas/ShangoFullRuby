require 'spec_helper'

describe "difficulties/index" do
  before(:each) do
    assign(:difficulties, [
      stub_model(Difficulty,
        :description => "Description"
      ),
      stub_model(Difficulty,
        :description => "Description"
      )
    ])
  end

  it "renders a list of difficulties" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
