class TripDatesController < ApplicationController
	before_action :set_trip_date, only: [:show, :edit, :update, :destroy]
	before_action :set_trip
	before_action :authenticate_guide
	before_action :confirm_authorized, only: [:edit, :update, :destroy]
	before_action :authenticate_admin, only: [:index]


	def index
		@trip_dates = TripDate.all
	end


	def show
	end


	def new
		@trip_date = TripDate.new
	end


	def edit
	end


	def create
		@trip_date = TripDate.new(trip_date_params)

		if @trip_date.end_date.blank?
			@trip_date.end_date = @trip_date.start_date
		end

		respond_to do |format|
			if @trip_date.save
				format.html { redirect_to new_trip_date_path, notice: 'Trip date was successfully created.' }
				format.json { render action: 'show', status: :created, location: @trip_date }
			else
				format.html { render action: 'new' }
				format.json { render json: @trip_date.errors, status: :unprocessable_entity }
			end
		end
	end


	def update
		respond_to do |format|
			if @trip_date.update(trip_date_params)
				format.html { redirect_to @trip_date, notice: 'Trip date was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @trip_date.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		@trip_date.destroy
		respond_to do |format|
			format.html { redirect_to trip_dates_url }
			format.json { head :no_content }
		end
	end

	private
		def set_trip_date
			@trip_date = TripDate.find(params[:id])
		end

		def set_trip
			@trip = Trip.find_by_id(session[:current_trip_id])
		end

		def trip_date_params
			params.require(:trip_date).permit(:trip_id, :start_date, :end_date)
		end

		def confirm_authorized
			if current_user && current_user.admin? && current_user.id == @trip.guide.user_id
				return true
			else
				redirect_to profile_path
			end
		end
end
