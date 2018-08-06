FactoryBot.define do
  factory :helper do
    name { Faker::String.name }
    email { Faker::Internet.email }
    password { Faker::String.name }
    phone_number { Faker::PhoneNumber.phone_number }
    helper_type_id nil
  end
end