require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :buyer_id => 1
    ))
  end

end
