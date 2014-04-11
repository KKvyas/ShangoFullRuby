require 'spec_helper'

describe "guides/show" do
  before(:each) do
    @guide = assign(:guide, stub_model(Guide,
      :user_id => "User",
      :intro => "Intro",
      :bio => "Bio",
      :approved => false,
      :banned => false
    ))
  end

end
