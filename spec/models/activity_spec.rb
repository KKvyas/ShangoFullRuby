# == Schema Information
#
# Table name: activities
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  description       :text
#  created_at        :datetime
#  updated_at        :datetime
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#

require 'spec_helper'

describe Activity do
	before do
		@activity = Activity.new( title: "Example Activity", description: "Example description.")
	end

	subject { @activity }

	it { should respond_to(:title) }
	it { should respond_to(:description) }

	it { should be_valid }

	describe "when title is not present" do
		before { @activity.title = " " }
		it { should_not be_valid }
	end

end 