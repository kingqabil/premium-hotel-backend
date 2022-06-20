FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'bertrand@app.com' }
    password { 'password' }
  end
end
