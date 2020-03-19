require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) { create(:user, password: 'test1234') }

  it 'to meals path if user is logged' do
    login(user)
    get(:new)
    expect(response).to redirect_to(meals_path)
  end

  it 'user makes login with valid attributes' do
    post(:create, params: { email: user.email, password: 'test1234' })
    expect(request.session[:user_id]).to eq(user.id)
    expect(response).to redirect_to(meals_path)
  end
 
  it 'user does not make login with invalid attributes' do
    post(:create, params: { email: user.email, password: '' })
    expect(request.session[:user_id]).to eq(nil)
    expect(response).to render_template(:new)
  end

  it 'user makes logout' do
    get(:logout)
    expect(request.session[:user_id]).to eq(nil)
    expect(response).to redirect_to(root_path)
  end
end
