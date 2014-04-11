# == Schema Information
#
# Table name: trips
#
#  id                 :integer          not null, primary key
#  activity_id        :string(255)
#  guide_id           :integer
#  difficulty_id      :integer
#  location_id        :integer
#  route_id           :integer
#  feature_id         :integer
#  latitude           :string(255)
#  longitude          :string(255)
#  required_gear      :text
#  supplied_gear      :text
#  special_directions :text
#  offer_capacity     :integer
#  trip_length_id     :integer
#  description        :text
#  itinerary          :text
#  created_at         :datetime
#  updated_at         :datetime
#  company_id         :integer
#  first_person_cost  :integer
#  second_person_cost :integer
#

class Trip < ActiveRecord::Base
	belongs_to :activity
	belongs_to :guide
	belongs_to :company

	belongs_to :length, :class_name => 'Length', :foreign_key => 'trip_length_id'

	belongs_to :difficulty
	belongs_to :location

	has_many :trip_dates
	has_many :order_items

	validates :activity_id, 		presence: :true
	validates :guide_id, 			presence: :true
	validates :difficulty_id,	 	presence: :true
	validates :location_id, 		presence: :true
	validates :description, 		presence: :true
	validates :trip_length_id,		presence: :true
	validates :company_id, 			presence: :true
	validates :first_person_cost,	presence: :true
	validates :second_person_cost,	presence: :true


	def tag_line
		self.length.description.downcase.capitalize + " of " + self.activity.title.downcase + " in " + self.location.description.downcase.capitalize
	end	
end
