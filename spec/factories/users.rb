FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'superpassword' }
    admin { false }
  end
end
