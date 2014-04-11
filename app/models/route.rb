# == Schema Information
#
# Table name: routes
#
#  id          :integer          not null, primary key
#  feature_id  :integer
#  name        :string(255)
#  description :text
#  rating      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Route < ActiveRecord::Base
	has_many :trips

	validates :feature_id,  presence: true
	validates :name,  presence: true

	validates_uniqueness_of :name
end
