require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(create(:user)).to be_valid
    end

    it 'is invalid without name' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'is invalid with name string empty' do
      expect(build(:user, email: '')).not_to be_valid
    end

    it 'is invalid without password' do
      expect(build(:user, password: nil)).not_to be_valid
    end

    it 'is invalid with password string empty' do
      expect(build(:user, password: '')).not_to be_valid
    end
  end
end
