require 'spec_helper'

describe "trip_dates/new" do
  before(:each) do
    assign(:trip_date, stub_model(TripDate,
      :trip_id => 1
    ).as_new_record)
  end

  it "renders new trip_date form" do
    render

    assert_select "form[action=?][method=?]", trip_dates_path, "post" do
      assert_select "input#trip_date_trip_id[name=?]", "trip_date[trip_id]"
    end
  end
end
