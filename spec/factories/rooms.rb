FactoryBot.define do
  factory :room do
    name { Faker::Name.name }
    city { Faker::Address.city }
    rate { Faker::Number.number(digits: 2) }
    room_type { Faker::Lorem.word }
    amenities { Faker::Lorem.sentence }
    picture { Faker::Lorem.sentence }
    user_id { 1 }
  end
end