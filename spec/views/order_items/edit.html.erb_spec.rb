require 'spec_helper'

describe "order_items/edit" do
  before(:each) do
    @order_item = assign(:order_item, stub_model(OrderItem,
      :order_id => 1,
      :company_id => 1,
      :trip_id => 1,
      :trip_date_id => 1,
      :number_of_people => 1
    ))
  end

  it "renders the edit order_item form" do
    render

    assert_select "form[action=?][method=?]", order_item_path(@order_item), "post" do
      assert_select "input#order_item_company_id[name=?]", "order_item[company_id]"
      assert_select "input#order_item_trip_id[name=?]", "order_item[trip_id]"
      assert_select "input#order_item_trip_date_id[name=?]", "order_item[trip_date_id]"
      assert_select "input#order_item_number_of_people[name=?]", "order_item[number_of_people]"
    end
  end
end
