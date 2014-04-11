require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :buyer_id => 1
    ))
  end
end
