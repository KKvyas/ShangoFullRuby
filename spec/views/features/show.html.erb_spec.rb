require 'spec_helper'

describe "features/show" do
  before(:each) do
    @feature = assign(:feature, stub_model(Feature,
      :location_id => 1,
      :name => "Name",
      :description => "MyText"
    ))
  end

end
