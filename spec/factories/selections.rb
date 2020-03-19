FactoryBot.define do
  factory :selection do
    month { 'march' }
    association :user, factory: :user, admin: true
    factory :selection_with_meals do
      transient { meals_count{ 5 } }
      after(:build) do |selection, evaluator|
        selection.meals = create_list(:meal, evaluator.meals_count, user: selection.user)
      end
    end
  end
end
