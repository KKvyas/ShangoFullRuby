# == Schema Information
#
# Table name: features
#
#  id          :integer          not null, primary key
#  location_id :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Feature do
	before do
		@feature = Feature.new( location_id: 2, name: "Example name.")
	end

	subject { @feature }

	it { should respond_to(:location_id) }
	it { should respond_to(:name) }

	it { should be_valid }

	describe "when location_id is not present" do
		before { @feature.location_id = " " }
		it { should_not be_valid }
	end

	describe "when name is not present" do
		before { @feature.name = " " }
		it { should_not be_valid }
	end


end 