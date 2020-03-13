require 'rails_helper'

RSpec.describe Selection, type: :model do
  context 'validations' do

    let(:meal) { create(:meal) } 
    
    it 'is valid with valid attributes' do
      selection = Selection.create(meal_id: meal.id, month: 'december')
      expect(selection).to be_valid
    end

    it 'is invalid without meal id' do
      selection = Selection.create(meal_id: nil, month: 'december')
      expect(selection).not_to be_valid 
    end

    it 'is invalid with month string empty' do
      meal = Meal.create(name: 'Pozole')
      selection = Selection.create(meal_id: meal.id, month: '')
      expect(selection).not_to be_valid 
    end

    it 'is invalid without month' do
      meal = Meal.create(name: 'Pozole')
      selection = Selection.create(meal_id: meal.id, month: nil)
      expect(selection).not_to be_valid 
    end
  end
end
