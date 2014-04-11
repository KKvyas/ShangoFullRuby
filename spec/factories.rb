FactoryGirl.define do
  factory :user do
	first   				"first"
	last					"last"
	email    				"first@example.com"
	password 				"foobar22"
	password_confirmation 	"foobar22"
  end
end