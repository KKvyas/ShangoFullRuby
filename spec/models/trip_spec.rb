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

require 'spec_helper'

describe Trip do
	before do
		@trip = Trip.new( 	activity_id: 1,
							guide_id: 1,
							difficulty_id: 1,
							trip_length_id: 1,
							location_id: 1,
							company_id: 1,
							first_person_cost: 250,
							second_person_cost: 150,
							description: 'description')
	end

	subject { @trip }

	it { should respond_to(:activity_id) }
	it { should respond_to(:guide_id) }
	it { should respond_to(:company_id) }
	it { should respond_to(:difficulty_id) }
	it { should respond_to(:location_id) }
	it { should respond_to(:description) }

	it { should be_valid }

	describe "when activity_id is not present" do
		before { @trip.activity_id = " " }
		it { should_not be_valid }
	end

	describe "when guide_id is not present" do
		before { @trip.guide_id = " " }
		it { should_not be_valid }
	end

	describe "when difficulty_id is not present" do
		before { @trip.difficulty_id = " " }
		it { should_not be_valid }
	end

	describe "when location_id is not present" do
		before { @trip.location_id = " " }
		it { should_not be_valid }
	end

	describe "when description is not present" do
		before { @trip.description = " " }
		it { should_not be_valid }
	end
end
