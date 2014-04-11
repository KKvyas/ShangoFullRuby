class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :edit, :update, :destroy]
	before_action :confirm_signed_in
	before_action :authenticate_admin, only: [:index, :destroy, :edit, :update]


	def index
		@orders = Order.all
	end

	def show
		@order_items = OrderItem.where("order_id = ?", @order.id)
	end


	def new
		@order = Order.new
		@user = current_user
		@order_items = OrderItem.where('buyer_id = ? AND order_id IS NULL', @user.id).all(:include => :trip_date, :order => 'trip_dates.start_date ASC')
	end


	def edit
	end


	def create
		@order = Order.new
		@order_items = OrderItem.where("buyer_id = ? AND order_id IS NULL", current_user.id)

		respond_to do |format|
			if @order.save
				@order_items.each do |i|
					i[:order_id] = @order.id
					i.save!
				end
				format.html { redirect_to profile_path, notice: 'Order was successfully created.' }
				format.json { render action: 'show', status: :created, location: @order }
			else
				format.html { render action: 'new' }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end


	def update
		respond_to do |format|
			if @order.update(order_params)
				format.html { redirect_to @order, notice: 'Order was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		@order.destroy
		respond_to do |format|
			format.html { redirect_to orders_url }
			format.json { head :no_content }
		end
	end

	private
		def set_order
			@order = Order.find(params[:id])
		end

		def order_params
			params.require(:order).permit()
		end
end
