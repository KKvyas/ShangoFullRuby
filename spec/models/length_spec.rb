# == Schema Information
#
# Table name: lengths
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Length do
	before do
		@length = Length.new( description: "Example description.")
	end

	subject { @length }

	it { should respond_to(:description) }

	it { should be_valid }

	describe "when description is not present" do
		before { @length.description = " " }
		it { should_not be_valid }
	end
end
