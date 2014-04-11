require 'spec_helper'

describe "trip_dates/show" do
  before(:each) do
    @trip_date = assign(:trip_date, stub_model(TripDate,
      :trip_id => 1
    ))
  end

end
