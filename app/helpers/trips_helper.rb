module TripsHelper
	def trip_tag_line(trip)
		trip.length.description + " " + trip.activity.title + " in " + trip.location.description
	end
end
