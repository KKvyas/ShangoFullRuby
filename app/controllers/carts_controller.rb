class CartsController < ApplicationController
	before_action :confirm_signed_in
	before_action :authenticate_admin, only: [:index]

	def show
		@order_items = OrderItem.where('buyer_id = ? AND order_id IS NULL', current_user.id).all(:include => :trip_date, :order => 'trip_dates.start_date ASC')
	end

	def index
		@order_items = OrderItem.all.where('order_is IS NULL')
	end
end