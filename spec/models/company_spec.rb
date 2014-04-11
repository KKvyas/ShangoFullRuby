# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  hq_address   :string(255)
#  hq_city      :string(255)
#  hq_state     :string(255)
#  country      :string(255)
#  description  :text
#  phone        :string(255)
#  email        :string(255)
#  owner_id     :integer
#  contact_name :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Company do
	before do
		@company = Company.new( name: "name",
								hq_address: "address",
								hq_city: "Ann Arbor",
								hq_state: "MI",
								country: "USA",
								description: "description",
								phone: "3039991515",
								email: "example@gmail.com",
								owner_id: 1,
								contact_name: "Shelby")
	end



	subject { @company }

	it { should respond_to(:name) }
	it { should respond_to(:hq_address) }
	it { should respond_to(:hq_city) }
	it { should respond_to(:hq_state) }
	it { should respond_to(:country) }
	it { should respond_to(:description) }
	it { should respond_to(:phone) }
	it { should respond_to(:email) }
	it { should respond_to(:owner_id) }
	it { should respond_to(:contact_name) }

	it { should be_valid }
end
