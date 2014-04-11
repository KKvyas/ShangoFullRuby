require 'spec_helper'

describe "activities/index" do
  before(:each) do
    assign(:activities, [
      stub_model(Activity,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Activity,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
