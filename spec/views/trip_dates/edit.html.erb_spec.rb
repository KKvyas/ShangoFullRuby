require 'spec_helper'

describe "trip_dates/edit" do
  before(:each) do
    @trip_date = assign(:trip_date, stub_model(TripDate,
      :trip_id => 1
    ))
  end

  it "renders the edit trip_date form" do
    render

    assert_select "form[action=?][method=?]", trip_date_path(@trip_date), "post" do
      assert_select "input#trip_date_trip_id[name=?]", "trip_date[trip_id]"
    end
  end
end
