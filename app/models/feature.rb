# == Schema Information
#
# Table name: features
#
#  id          :integer          not null, primary key
#  location_id :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Feature < ActiveRecord::Base
	has_many :trips

	validates :location_id,  presence: true
	validates :name,  presence: true
	validates_uniqueness_of :name
end

