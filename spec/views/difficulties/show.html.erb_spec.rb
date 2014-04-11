require 'spec_helper'

describe "difficulties/show" do
  before(:each) do
    @difficulty = assign(:difficulty, stub_model(Difficulty,
      :description => "Description"
    ))
  end


end
