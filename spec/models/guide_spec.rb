# == Schema Information
#
# Table name: guides
#
#  id         :integer          not null, primary key
#  user_id    :string(255)
#  intro      :string(255)
#  bio        :string(255)
#  approved   :boolean
#  banned     :boolean
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Guide do
	before do
		@guide = Guide.new( user_id: 1, intro: "Example into.", bio: "Example bio.")
	end

	subject { @guide }

	it { should respond_to(:user_id) }
	it { should respond_to(:intro) }
	it { should respond_to(:bio) }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @guide.user_id = " " }
		it { should_not be_valid }
	end

	describe "when intro is not present" do
		before { @guide.intro = " " }
		it { should_not be_valid }
	end

	describe "when bio is not present" do
		before { @guide.bio = " " }
		it { should be_valid }
	end

end 