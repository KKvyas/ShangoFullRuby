# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  description :string(255)
#  latitude    :string(255)
#  longitude   :string(255)
#  agency_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Location do
	before do
		@location = Location.new( description: "Example description.")
	end

	subject { @location }

	it { should respond_to(:description) }

	it { should be_valid }

	describe "when description is not present" do
		before { @location.description = " " }
		it { should_not be_valid }
	end
end
