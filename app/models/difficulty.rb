# == Schema Information
#
# Table name: difficulties
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Difficulty < ActiveRecord::Base
	has_many :trips

	validates :description, presence: :true
end
