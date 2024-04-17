FactoryBot.define do
  factory :provider do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.phone_number }
  end
end
