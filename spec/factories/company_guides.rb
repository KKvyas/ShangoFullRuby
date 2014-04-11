# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_guide do
    company_id 1
    guide_id 1
    guide_confirmed false
    company_confirmed false
  end
end
