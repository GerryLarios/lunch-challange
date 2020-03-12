require 'rails_helper'

RSpec.describe Selection, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      meal = Meal.create(name: 'Pozole')
      selection = Selection.create(user_id: 1, meal_id: meal.id, month: 'december')
      expect(selection).to be_valid
    end

    it 'is invalid without meal id' do
      selection = Selection.create(user_id: 1, meal_id: nil, month: 'december')
      expect(selection).not_to be_valid 
    end
  end
end
