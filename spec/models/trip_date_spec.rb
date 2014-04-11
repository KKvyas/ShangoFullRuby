# == Schema Information
#
# Table name: trip_dates
#
#  id         :integer          not null, primary key
#  trip_id    :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe TripDate do
	before do
		@trip_date = TripDate.new( trip_id: 1, start_date: "1/12/14", end_date: "1/12/14")
	end

	subject { @trip_date }

	it { should respond_to(:trip_id) }
	it { should respond_to(:start_date) }
	it { should respond_to(:end_date) }

	it { should be_valid }

	describe "when trip_id is not present" do
		before { @trip_date.trip_id = " " }
		it { should_not be_valid }
	end

	describe "when start date is not present" do
		before { @trip_date.start_date = " " }
		it { should_not be_valid }
	end

	describe "when end date is not present" do
		before { @trip_date.end_date = " " }
		it { should be_valid }
	end
end
