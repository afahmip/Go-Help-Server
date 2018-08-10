FactoryBot.define do
  factory :user_request do
    user_id { Faker::Number.number(1) }
    helper_type_id { Faker::Number.number(1) }
    longitude { Faker::Number.decimal(3, 7) }
    latitude { Faker::Number.decimal(3, 7) }
    device_id { Faker::IDNumber.valid }
  end
end