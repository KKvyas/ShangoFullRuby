module OrderItemsHelper

	def length(order_item)
		length = order_item.trip.length
		start = order_item.trip_date.start_date
		finish = order_item.trip_date.end_date


		if length.id <= 2
			"A " + length.description.downcase
		else
			(finish - start + 1) + " days"
		end
	end

	def trip_summary(order_item)
		start = order_item.trip_date.start_date
		finish = order_item.trip_date.end_date
		length = order_item.trip.length
		activity = order_item.trip.activity.title
		location = order_item.trip.location.description

		description = length(order_item) + " of " + activity.downcase

		if start == finish && length.id <= 2
			description + ", on " + start.strftime("%m/%d/%y")
		else
			description + ", from " + start.strftime("%m/%d") + " through " + finish.strftime("%m/%d/%y") + "."
		end
	end
end
