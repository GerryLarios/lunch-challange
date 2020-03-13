require 'rails_helper'

RSpec.describe Meal, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:meal)).to be_valid
    end

    it 'is invalid without name' do
      expect(build(:meal, name: nil)).not_to be_valid
    end

    it 'is invalid with name string empty' do
      expect(build(:meal, name: '')).not_to be_valid
    end

    it 'is invalid without image' do
      expect(Meal.create(name: 'Tacos de asada', img: nil)).not_to be_valid
    end
  end
end
