

###     BE CAREFUL    ####

###     Data in this file is configured to accommodate dependies throughout the app. Changing data, particularly ID numbers, will break the app.

###     BE CAREFUL    ####



#Activities

	Activity.delete_all

	RockClimb = Activity.create({ 
		:id => 2,
		:title => 'Rock Climbing', 
		:description => 'Climb quickly and comfortably up classic crack climbs with a classy, commanding kletterfuhren using quirky climbing configurations.',
		:icon => File.new("#{Rails.root}/app/assets/images/activity_icons/rock_climbing.png")
		})

	MtnBike = Activity.create({ 
		:id => 1,
		:title => 'Mountain Biking', 
		:description => 'Swoop swiftly over sweet singletrack soirees with a sassy, saucy, single sender.',
		:icon => File.new("#{Rails.root}/app/assets/images/activity_icons/mtn_biking.png")
		})

	FlyFish = Activity.create({ 
		:id => 3,
		:title => 'Fly Fishing', 
		:description => 'Fetch freaking fat fish with a fine, fetching fly fishing fellow.',
		:icon => File.new("#{Rails.root}/app/assets/images/activity_icons/fly_fishing.png")
		})


#Difficulties

	Difficulty.delete_all

	Easy = Difficulty.create({
		:id => 1,
		:description => 'Easy'
		})

	Moderate = Difficulty.create({
		:id => 2,
		:description => 'Moderate'
		})

	Hard = Difficulty.create({
		:id => 3,
		:description => 'Hard'
		})


#Lengths

	Length.delete_all

	Half = Length.create({
		:id => 1,
		:description => 'Half Day'
		})

	Full = Length.create({
		:id => 2,
		:description => 'Full Day'
		})

	Multi = Length.create({
		:id => 3,
		:description => 'Multi-Day'
		})




###     BE CAREFUL    ####

###     Data in this file is configured to accommodate dependies throughout the app. Changing data, particularly ID numbers, will break the app.

###     BE CAREFUL    ####

#Company

	if Rails.env.development?
#		Company.find_by_id(1).delete

		company_1 = Company.create({
			:id => 1,
			:name => "Example company",
			:email => "info@examplecompany.com",
			:owner_id => 2,
			:contact_name => "Gerald"
			})
	end


#Users

	if Rails.env.development?

		unless User.find_by_id(1)
			steel = User.create({
				:id => 1,
				:admin => true,
				:first => "Adam",
				:last => "Steel",
				:email => "adamgsteel@gmail.com",
				:password => "secrets1",
				:password_confirmation => "secrets1"
				})
		end			

		unless User.find_by_id(2)
			dengler = User.create({
				:id => 2,
				:admin => true,
				:first => "Adam",
				:last => "Dengler",
				:email => "adam.dengler@gmail.com",
				:password => "secrets1",
				:password_confirmation => "secrets1"
				})
		end
	end

#Guides

	if Rails.env.development?

		unless Guide.find_by_id(1)
			guide_one = Guide.create({
				:id => 1,
				:user_id => 1,
				:intro => "I am going to rock your world!",
				:approved => true
				})
		end

		unless Guide.find_by_id(2)
			guide_two = Guide.create({
				:id => 2,
				:user_id => 2,
				:intro => "I'm a pretty nice person.'",
				:approved => true
				})
		end
	end

#Trips

	if Rails.env.development?

		unless Trip.find_by_id(1)
			mtb_half = Trip.create({
					:id => 1,
					:activity_id => 1,
					:guide_id => 1,
					:difficulty_id => 1,
					:trip_length_id => 1,
					:location_id => 1,
					:company_id => 1,
					:first_person_cost => 150,
					:second_person_cost => 120,
					:offer_capacity => 4,
					:description => "A wonderful time in the hills"
				})
		end	

		unless Trip.find_by_id(2)
			mtb_full = Trip.create({
					:id => 2,
					:activity_id => 1,
					:guide_id => 1,
					:difficulty_id => 2,
					:trip_length_id => 1,
					:location_id => 1,
					:company_id => 1,
					:first_person_cost => 250,
					:second_person_cost => 120,
					:offer_capacity => 4,
					:description => "A wonderful longer time in the hills"
				})
		end	
		
		unless Trip.find_by_id(3)
			rock_half = Trip.create({
					:id => 3,
					:activity_id => 2,
					:guide_id => 2,
					:difficulty_id => 1,
					:trip_length_id => 1,
					:location_id => 1,
					:company_id => 1,
					:first_person_cost => 150,
					:second_person_cost => 100,
					:offer_capacity => 4,
					:description => "A wonderful time on the rocks, briefly"
				})
		end

		unless Trip.find_by_id(4)
			rock_full = Trip.create({
					:id => 4,
					:activity_id => 2,
					:guide_id => 2,
					:difficulty_id => 2,
					:trip_length_id => 2,
					:location_id => 1,
					:company_id => 1,
					:first_person_cost => 250,
					:second_person_cost => 100,
					:offer_capacity => 4,
					:description => "A wonderful time on the rock, all the time."
				})
		end

		unless Trip.find_by_id(5)
			fly_half = Trip.create({
					:id => 5,
					:activity_id => 3,
					:guide_id => 1,
					:difficulty_id => 1,
					:trip_length_id => 1,
					:location_id => 1,
					:company_id => 1,
					:first_person_cost => 200,
					:second_person_cost => 100,
					:offer_capacity => 4,
					:description => "A wonderful time in the river"
				})
		end

		unless Trip.find_by_id(6)
			fly_full = Trip.create({
					:id => 6,
					:activity_id => 3,
					:guide_id => 2,
					:difficulty_id => 2,
					:trip_length_id => 1,
					:location_id => 1,
					:company_id => 1,
					:first_person_cost => 380,
					:second_person_cost => 200,
					:offer_capacity => 4,
					:description => "A wonderful time in the river with fishes."
				})
		end
	end

#TripDates

	if Rails.env.development?

		TripDate.delete_all

		unless TripDate.find_by_id(1)
			TripDate.create({
				:id => 1,
				:trip_id => 1,
				:start_date => '2014-06-26',
				:end_date => '2014-06-26'
				})
		end

		unless TripDate.find_by_id(2)
			TripDate.create({
				:id => 2,
				:trip_id => 2,
				:start_date => '2014-06-01',
				:end_date => '2014-06-02'
				})
		end

		unless TripDate.find_by_id(3)
			TripDate.create({
				:id => 3,
				:trip_id => 3,
				:start_date => '2014-06-27',
				:end_date => '2014-06-27'
				})
		end

		unless TripDate.find_by_id(4)
			TripDate.create({
				:id => 4,
				:trip_id => 4,
				:start_date => '2014-06-20',
				:end_date => '2014-06-21'
				})
		end

		unless TripDate.find_by_id(5)
			TripDate.create({
				:id => 5,
				:trip_id => 5,
				:start_date => '2014-07-15',
				:end_date => '2014-07-15'
				})
		end

		unless TripDate.find_by_id(6)
			TripDate.create({
				:id => 6,
				:trip_id => 6,
				:start_date => '2014-08-07',
				:end_date => '2014-08-07'
				})
		end
	end

#
