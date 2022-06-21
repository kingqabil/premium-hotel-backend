FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'bertrande@app.com' }
    password { 'password' }
  end
end