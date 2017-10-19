FactoryGirl.define do
	to_create {|instance| instance.save(validate: false) }
  factory :character do
  	id 1
    name "example_name"
    avatar "avatar_default.jpg"
    user_id ""
  end
end