FactoryBot.define do
  factory :reservation do
    start_date { Faker::Date.forward(days: 30) }
    end_date { Faker::Date.forward(days: 30) }
  end
end