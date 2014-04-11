# == Schema Information
#
# Table name: order_items
#
#  id                 :integer          not null, primary key
#  order_id           :integer
#  company_id         :integer
#  trip_id            :integer
#  trip_date_id       :integer
#  number_of_people   :integer
#  created_at         :datetime
#  updated_at         :datetime
#  buyer_id           :integer
#  first_person_cost  :integer
#  second_person_cost :integer
#

require 'spec_helper'

describe OrderItem do
	before do
		@order_item = OrderItem.new( company_id: 1, trip_id: 1, trip_date_id: 1, buyer_id: 1, number_of_people: 2, first_person_cost: 100, second_person_cost: 50)
	end

	subject { @order_item }

	it { should respond_to(:company_id) }
	it { should respond_to(:trip_id) }
	it { should respond_to(:trip_date_id) }
	it { should respond_to(:buyer_id) }
	it { should respond_to(:first_person_cost) }
	it { should respond_to(:second_person_cost) }

	it { should be_valid }
end
