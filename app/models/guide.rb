# == Schema Information
#
# Table name: guides
#
#  id         :integer          not null, primary key
#  user_id    :string(255)
#  intro      :string(255)
#  bio        :string(255)
#  approved   :boolean
#  banned     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Guide < ActiveRecord::Base
	has_many :trips, dependent: :destroy

	belongs_to	:user

	validates :user_id,  presence: true
	validates :intro,  presence: true
end
