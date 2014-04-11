require 'spec_helper'

describe "order_items/new" do
  before(:each) do
    assign(:order_item, stub_model(OrderItem,
      :company_id => 1,
      :trip_id => 1,
      :trip_date_id => 1,
      :number_of_people => 1
    ).as_new_record)
  end

end
