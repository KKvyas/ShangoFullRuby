# == Schema Information
#
# Table name: routes
#
#  id          :integer          not null, primary key
#  feature_id  :integer
#  name        :string(255)
#  description :text
#  rating      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Route do
	before do
		@route = Route.new( feature_id: 1, name: "name")
	end

	subject { @route }

	it { should respond_to(:feature_id) }
	it { should respond_to(:name) }

	it { should be_valid }

	describe "when feature_id is not present" do
		before { @route.feature_id = " " }
		it { should_not be_valid }
	end

	describe "when name is not present" do
		before { @route.name = " " }
		it { should_not be_valid }
	end
end