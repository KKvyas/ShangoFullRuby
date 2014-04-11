require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :buyer_id => 1
      ),
      stub_model(Order,
        :buyer_id => 1
      )
    ])
  end
end
