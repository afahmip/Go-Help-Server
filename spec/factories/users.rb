FactoryBot.define do
  factory :user do
    user_id { Faker::Number.number(1) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Name.name }
    device_id { Faker::Name.name }
  end
end