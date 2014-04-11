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

class OrderItem < ActiveRecord::Base

	belongs_to :order
	belongs_to :company
	belongs_to :trip
	belongs_to :trip_date
	belongs_to :user, :class_name => 'User', :foreign_key => :buyer_id

	validates :company_id,			presence: :true
	validates :trip_id, 			presence: :true
	validates :trip_date_id,		presence: :true
	validates :number_of_people, 	presence: :true
	validates :buyer_id, 			presence: :true
	validates :first_person_cost,	presence: :true
	validates :second_person_cost,	presence: :true

	def total
		total = 0
		if number_of_people && first_person_cost && second_person_cost
			if number_of_people == 1
				total = first_person_cost
			elsif number_of_people > 1
				total = first_person_cost + (second_person_cost * (number_of_people-1))
			else
				total = 0
			end
		else
			"Not enough information supplied."
		end
	end

end
