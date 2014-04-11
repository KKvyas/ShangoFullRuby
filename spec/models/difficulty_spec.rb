# == Schema Information
#
# Table name: difficulties
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Difficulty do
	before do
		@difficulty = Difficulty.new( description: "Example description.")
	end

	subject { @difficulty }

	it { should respond_to(:description) }

	it { should be_valid }

	describe "when description is not present" do
		before { @difficulty.description = " " }
		it { should_not be_valid }
	end

end 