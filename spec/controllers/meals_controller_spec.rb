require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  describe 'GET #index' do
  
    let(:meal) { create(:meal) }

    it 'populates an array of meals' do
      get(:index)
      expect(assigns(:meals)).to eq([meal])
    end

    it 'renders the :index view' do
      get(:index)
      expect(response).to render_template(:index)
    end
  end
  
  describe 'POST #create' do
    let(:meal) { create(:meal) }
    
    let(:valid_params) do
      { meal: { name: 'Tacos', img: Rack::Test::UploadedFile.new(Rails.root.join('food.png')) } }
    end
    
    context 'with valid attributes' do
      it 'saves the new meal in the database' do
        expect{ post(:create, params: valid_params) }.to change(Meal, :count).by(1)
      end
      
      it 'redirects to the meals page' do
        post(:create, params: valid_params)
        expect(response).to redirect_to(meals_path)
      end
    end
    
    let (:invalid_params) do
      { meal: { name: '',  img: Rack::Test::UploadedFile.new(Rails.root.join('food.png')) } }
    end

    context 'with invalid attributes' do
      it 'does not save the new meal in the database' do
        expect{ post(:create, params: invalid_params) }.to_not change(Meal, :count)
      end

      it 'renders the :new template' do
        post(:create, params: invalid_params)
        expect(response).to render_template(:new) 
      end
    end
  end
end
