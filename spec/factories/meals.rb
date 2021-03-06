FactoryBot.define do
  factory :meal do
    name { 'Tacos' }
    association :user, factory: :user, admin: true
    after(:build) do |meal|
      meal.img.attach(io: File.open(Rails.root.join('food.png')), filename: 'food.png', content_type: 'image/png')
    end
  end
end
