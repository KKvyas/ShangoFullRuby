# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  hq_address   :string(255)
#  hq_city      :string(255)
#  hq_state     :string(255)
#  country      :string(255)
#  description  :text
#  phone        :string(255)
#  email        :string(255)
#  owner_id     :integer
#  contact_name :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Company < ActiveRecord::Base

	has_many :order_items
	belongs_to :user

	validates :name, 			presence: :true
	validates :hq_address, 		presence: :true
	validates :hq_city, 		presence: :true
	validates :hq_state, 		presence: :true
	validates :country, 		presence: :true
	validates :description,		presence: :true
	validates :owner_id, 		presence: :true
	validates :email, 			presence: :true
	validates :phone,			presence: :true
	validates :contact_name,	presence: :true

	validates_uniqueness_of :email

end
