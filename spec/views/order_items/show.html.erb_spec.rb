require 'spec_helper'

describe "order_items/show" do
  before(:each) do
    @order_item = assign(:order_item, stub_model(OrderItem,
      :order_id => 1,
      :company_id => 2,
      :trip_id => 3,
      :trip_date_id => 4,
      :number_of_people => 5
    ))
  end

end
