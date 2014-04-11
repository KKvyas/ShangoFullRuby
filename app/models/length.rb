# == Schema Information
#
# Table name: lengths
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Length < ActiveRecord::Base
	has_many :trips, :class_name => 'Trip', :foreign_key => 'trip_length_id'

	validates :description,  presence: true
end
