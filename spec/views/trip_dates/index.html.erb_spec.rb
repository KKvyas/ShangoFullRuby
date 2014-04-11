require 'spec_helper'

describe "trip_dates/index" do
  before(:each) do
    assign(:trip_dates, [
      stub_model(TripDate,
        :trip_id => 1
      ),
      stub_model(TripDate,
        :trip_id => 1
      )
    ])
  end

  it "renders a list of trip_dates" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
