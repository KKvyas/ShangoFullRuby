require 'spec_helper'

describe UsersHelper do
	before do
		@user = User.create(:admin => true)
	end

	describe "admin?" do
    	it "should return admin status" do
      		expect(@user.admin?).to eq(true)
    	end
    end
end
