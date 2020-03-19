FactoryBot.define do
  factory :user do
    email { 'trainee@ucol.mx' }
    password { 'superpassword' }
    admin { false }
  end
end
