FactoryGirl.define do
  factory :user do
    username "example_name"
    sequence(:email) { |n| "example_name#{n}@example.com" }
    password "secret"
    password_confirmation "secret"
  end
end