require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :buyer_id => 1
    ).as_new_record)
  end

end
