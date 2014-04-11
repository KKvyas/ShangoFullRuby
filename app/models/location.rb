# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  description :string(255)
#  latitude    :string(255)
#  longitude   :string(255)
#  agency_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Location < ActiveRecord::Base
	has_many :trips

	validates :description,  presence: true
	validates_uniqueness_of :description
end
