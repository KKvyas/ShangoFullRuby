# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean
#  guide_status           :integer
#  first                  :string(255)
#  last                   :string(255)
#  email                  :string(255)
#  phone                  :string(255)
#  birthday               :date
#  gender                 :string(255)
#  street_address         :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  emergency_first        :string(255)
#  emergency_last         :string(255)
#  emergency_relationship :string(255)
#  emergency_phone        :string(255)
#  emergency_email        :string(255)
#  emergency_notes        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  customer_uri           :string(255)
#

class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :lockable, :timeoutable and :omniauthable
	devise	:database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable, :confirmable

	has_one :guide, :class_name => 'Guide', :foreign_key => 'user_id'
	has_one :company, :class_name => 'Company', :foreign_key => 'owner_id'
	has_many :trips, through: :guide
	has_many :order_items, :class_name => 'OrderItem', :foreign_key => 'buyer_id'
	has_many :buyers, :class_name => 'OrderItem', :foreign_key => 'buyer_id'

	validates_associated :order_items
	validates_associated :buyers

	validates :first, 			presence: :true
	validates :last, 			presence: :true
	validates :email,			presence: :true

	validates_uniqueness_of :email

	before_validation {

		self.first.to_s.strip
		self.last.to_s.strip
		self.email.to_s.strip
		self.phone 				       			= phone_scrub(self.phone.to_s.strip)
		self.street_address.to_s.strip
		self.city.to_s.strip
		self.state.to_s.strip
		self.emergency_first.to_s.strip
		self.emergency_last.to_s.strip
		self.emergency_relationship.to_s.strip
		self.emergency_phone       				= phone_scrub(self.emergency_phone.to_s.strip)
		self.emergency_email.to_s.strip 

	}

	@blank = " - "

	def full_name
		first + " " + last
	end

	def services_total
		total = 0
		order_items = self.order_items.where('order_id IS NULL')
		order_items.each do |i|
			total = total + i.first_person_cost
			if i.number_of_people > 1
		  		total = total + (i.number_of_people - 1) * i.second_person_cost
			end
	  	end

	  	return total
	end

	def taxes_total
		return 0
	end

	def order_total
		services_total + taxes_total
	end

	def full_address
		if full_address?
			street_address + ", " + city + ", " + state
		else
			""
		end
	end

	def full_name
		if first && last
			first + " " + last
		else
			"n/a"
		end
	end

	def emergency_full_name
		if emergency_first && emergency_last
			emergency_first + " " + emergency_last
		else
			"n/a"
		end
	end

	def admin?
		if admin == true
			true
		else
			false
		end
	end

	def guide?
		if self.guide && self.guide.approved == true && self.guide.banned != true
			return true
		else 
			return false
		end
	end

	def guide_in_waiting?
		return true if self.guide && self.guide.approved == nil
	end

	def emergency_contact?
		if emergency_first && emergency_last && emergency_phone && emergency_email && emergency_relationship
			return true
		else
			return false
		end
	end

	def full_address?
		unless street_address.blank? || state.blank? || city.blank?
			true
		else
			false
		end
	end

	def profile_complete?
		if phone && email && full_address? && emergency_contact? 
			return true
		else
			return false
		end
	end

	def missing_attributes
		@missing = []
		unless emergency_contact?
			@missing.push("Your complete emergency contact information.")
		end

		unless full_address?
			@missing.push("Your complete address information.")
		end

		if self.phone.blank?
			@missing.push("The best phone number to reach you at.")
		end

		return @missing
	end

	def phone_scrub(number)
		number.to_s.gsub(/\D/, '')
	end

end
