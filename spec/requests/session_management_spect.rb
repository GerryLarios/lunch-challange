require 'rails_helper'

RSpec.describe 'Session management', type: :request do
  it 'redirect to sessions path if user is not logged' do
    get(meals_path)
    expect(response).to redirect_to(root_path)
  end
end
