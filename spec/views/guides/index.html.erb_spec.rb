require 'spec_helper'

describe "guides/index" do
  before(:each) do
    assign(:guides, [
      stub_model(Guide,
        :user_id => "User",
        :intro => "Intro",
        :bio => "Bio",
        :approved => false,
        :banned => false
      ),
      stub_model(Guide,
        :user_id => "User",
        :intro => "Intro",
        :bio => "Bio",
        :approved => false,
        :banned => false
      )
    ])
  end

end
