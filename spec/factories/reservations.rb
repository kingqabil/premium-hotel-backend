FactoryBot.define do
  factory :reservation do
    check_in { Faker::Date.forward(days: 30) }
    check_out { Faker::Date.forward(days: 30) }
  end
end