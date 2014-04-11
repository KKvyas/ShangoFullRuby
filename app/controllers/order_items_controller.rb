class OrderItemsController < ApplicationController
	before_action :set_order_item, only: [:show, :edit, :update, :destroy]
	before_filter :set_trip, :set_user, :confirm_signed_in
	before_action :confirm_authorized, only: [:destroy, :edit, :update]
	before_action :authenticate_admin, only: [:index]

	def index
		@order_items = OrderItem.all
	end


	def show
	end


	def new
		@order_item = OrderItem.new
		@trip_dates = TripDate.where('trip_id = ?', @trip.id)
	end


	def edit
	end


	def create
		@order_item = OrderItem.new(order_item_params)
		respond_to do |format|
			if @order_item.save
				format.html { redirect_to cart_path, notice: 'Your trip has been added to your cart.' }
				format.json { render action: 'show', status: :created, location: @order_item }
			else
				format.html { redirect_to new_order_item_path, notice: 'We were unable to customize your trip.' }
				format.json { render json: @order_item.errors, status: :unprocessable_entity }
			end
		end
	end


	def update
		respond_to do |format|
			if @order_item.update(order_item_params)
				format.html { redirect_to cart_path, notice: 'Order item was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @order_item.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		@order_item.destroy
		respond_to do |format|
			format.html { redirect_to cart_path }
			format.json { head :no_content }
		end
	end

	private
		def set_order_item
			@order_item = OrderItem.find(params[:id])
		end


		def order_item_params
			params.require(:order_item).permit(	:order_id,
												:company_id,
												:trip_id,
												:trip_date_id,
												:number_of_people,
												:buyer_id,
												:first_person_cost,
												:second_person_cost )
		end

		def set_trip
			@trip = Trip.find_by_id(session[:current_trip_id])
		end

		def confirm_authorized
			confirm_signed_in
			if current_user.id == @order_item.buyer_id
				return true
			elsif current_user.admin?
				return true
			else
				redirect_to cart_path
			end
		end
				
end
