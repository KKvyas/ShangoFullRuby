class TripsController < ApplicationController
	before_action :set_trip, only: [:show, :edit, :update, :destroy]
	before_filter :set_trip_variables, only: [:edit, :new]
	before_action :authenticate_admin, only: [:index]

	def index
		@trips = Trip.all
	end


	def show
		session[:current_trip_id] = @trip.id
	end


	def new
		@trip = Trip.new
	end


	def edit
	end


	def create
		@trip = Trip.new(trip_params)

		respond_to do |format|
			if @trip.save
				session[:current_trip_id] = @trip.id 
				format.html { redirect_to new_trip_date_path, notice: 'Trip was successfully created. Please choose dates.' }
				format.json { render action: 'show', status: :created, location: @trip }
			else
				format.html { render action: 'new' }
				format.json { render json: @trip.errors, status: :unprocessable_entity }
			end
		end
	end


	def update
		respond_to do |format|
			if @trip.update(trip_params)
				format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @trip.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		@trip.destroy
		respond_to do |format|
			format.html { redirect_to trips_url }
			format.json { head :no_content }
		end
	end

	private

		def set_trip_variables
			@activities = Activity.all
			@difficulties = Difficulty.all
			@locations = Location.all
			@lengths = Length.all
		end

		def set_trip
			@trip = Trip.find(params[:id])
		end

		def trip_params
			params.require(:trip).permit(	:activity_id,
											:guide_id,
											:difficulty_id,
											:location_id,
											:route_id,
											:feature_id,
											:latitude,
											:longitude,
											:required_gear,
											:supplied_gear,
											:special_directions,
											:offer_capacity,
											:trip_length_id,
											:description,
											:itinerary,
											:company_id,
											:first_person_cost,
											:second_person_cost)
		end

		def confirm_authorized
			if current_user && current_user.admin? && current_user.id == @trip.guide.user_id
				return true
			else
				redirect_to profile_path
			end
		end
end
