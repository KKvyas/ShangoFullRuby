# == Schema Information
#
# Table name: trip_dates
#
#  id         :integer          not null, primary key
#  trip_id    :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

class TripDate < ActiveRecord::Base
	belongs_to :trip
	belongs_to :order_item

	validates :trip_id,  	presence: true
	validates :start_date,  presence: true

	def date_range
		if start_date == end_date
			start_date.strftime('%-m/%-d/%y')
		else
			start_date.strftime('%-m/%-d') + " - " + end_date.strftime('%-m/%-d/%y')
		end
	end
end
