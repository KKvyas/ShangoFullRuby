require 'spec_helper'

describe "lengths/show" do
  before(:each) do
    @length = assign(:length, stub_model(Length,
      :description => "Description"
    ))
  end

end
