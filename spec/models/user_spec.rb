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

require "spec_helper"

describe User do
	before do
		@user = User.new( first: "example", last: "person", email: "example@gmail.com", password: "secrets1", password_confirmation: "secrets1")
	end

	subject { @user }

	it { should respond_to(:first) }
	it { should respond_to(:last) }
	it { should respond_to(:email) }

	it { should be_valid }
  # it "orders by first name" do
  #   lindeman = User.create!(first: "Andy", last: "Lindeman", email:'alindeman@gmail.com', password:'heyhey!!', password_confirmation:'heyhey!!')
  #   chelimsky = User.create!(first: "David", last: "Chelimsky", email:'dchelimsky@gmail.com', password:'heyhey!!', password_confirmation:'heyhey!!')

  #   expect(User.all).to eq([lindeman, chelimsky])
  # end
end
