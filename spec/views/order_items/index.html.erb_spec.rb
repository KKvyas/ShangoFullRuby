require 'spec_helper'

describe "order_items/index" do
  before(:each) do
    assign(:order_items, [
      stub_model(OrderItem,
        :order_id => 1,
        :company_id => 2,
        :trip_id => 3,
        :trip_date_id => 4,
        :number_of_people => 5
      ),
      stub_model(OrderItem,
        :order_id => 1,
        :company_id => 2,
        :trip_id => 3,
        :trip_date_id => 4,
        :number_of_people => 5
      )
    ])
  end

end
