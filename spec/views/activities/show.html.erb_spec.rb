require 'spec_helper'

describe "activities/show" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :title => "Title",
      :description => "MyText"
    ))
  end
end
