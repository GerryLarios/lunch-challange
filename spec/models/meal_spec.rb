require 'rails_helper'

RSpec.describe Meal, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      meal = Meal.create(name: 'Caldo de pollo')
      expect(meal).to be_valid
    end

    it 'is invalid without name' do
      meal = Meal.create(name: nil)
      expect(meal).not_to be_valid
    end
  end
end
