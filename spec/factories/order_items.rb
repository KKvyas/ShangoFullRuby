# == Schema Information
#
# Table name: order_items
#
#  id                 :integer          not null, primary key
#  order_id           :integer
#  company_id         :integer
#  trip_id            :integer
#  trip_date_id       :integer
#  number_of_people   :integer
#  created_at         :datetime
#  updated_at         :datetime
#  buyer_id           :integer
#  first_person_cost  :integer
#  second_person_cost :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    order_id 1
    company_id 1
    trip_id 1
    trip_date_id 1
    number_of_people 1
  end
end
