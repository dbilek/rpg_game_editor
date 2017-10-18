FactoryGirl.define do
  factory :user do
  	id 1
    username "example_name"
    sequence(:email) { |n| "example_name#{n}@example.com" }
    password "secret"
    password_confirmation "secret"
    reset_password_token ""
  end
end