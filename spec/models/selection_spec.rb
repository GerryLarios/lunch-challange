require 'rails_helper'

RSpec.describe Selection, type: :model do
  context 'validations' do
    
    let(:user) { create(:user, admin: true) }
    
    it 'is valid with valid attributes' do
      selection = build(:selection_with_meals, user: user)
      expect(selection).to be_valid
    end

    it 'is invalid without user' do
      expect(Selection.new(month: 'march', user: nil)).not_to be_valid
    end

    it 'is invalid without month' do
      selection = build(:selection, month: nil)
      expect(selection).not_to be_valid
    end

    it 'is invalid with month string empty' do
      selection = build(:selection, month: '')
      expect(selection).not_to be_valid
    end

    it 'is invalid without meals' do
      selection = build(:selection, user: user)
      selection.meals = []
      selection.save
      expect(selection).not_to be_valid
    end

    it 'is invalid with more than five meals' do
      selection = build(:selection_with_meals, user: user)
      selection.meals << create(:meal, user: user)
      expect(selection).not_to be_valid
    end
  end
end
