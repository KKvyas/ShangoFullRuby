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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "MyString"
    hq_address "MyString"
    hq_city "MyString"
    hq_state "MyString"
    country "MyString"
    description "MyText"
    phone "MyString"
    email "MyString"
    owner_id 1
    contact_name "MyString"
  end
end
