require 'spec_helper'

describe "routes/show" do
  before(:each) do
    @route = assign(:route, stub_model(Route,
      :feature_id => 1,
      :name => "Name",
      :description => "MyText",
      :rating => "Rating"
    ))
  end

end
