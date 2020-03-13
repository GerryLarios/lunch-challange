require 'rails_helper'

RSpec.describe SelectionsController, type: :controller do
  
  let(:meal) { create(:meal) }
  
  describe 'GET index' do
    it 'populates an array of selections' do
      selection = Selection.create(meal: meal, month: 'march')
      get(:index)
      expect(assigns(:selections)).to eq([selection])
    end

    it 'renders the :index view' do
      get(:index)
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    
    let(:valid_params) do
      { selection: { meal_id: ['', meal.id], month: 'march' } }
    end

    context 'with valid attributes' do
      it 'saves the bunch of selections in the database' do
        expect{ post(:create, params: valid_params) }.to change(Selection, :count).by(1)
      end

      it 'redirects to the selections page' do
        post(:create, params: valid_params)
        expect(response).to redirect_to(selections_path)
      end
    end
    
    let(:invalid_params) do
      { selection: { meal_id: ['', 0], month: nil } }
    end

    context 'with invalid attributes' do
      it 'does not save the selections in the database' do
        expect{ post(:create, params: invalid_params) }.to_not change(Selection, :count)
      end

      it 'renders the :new template with invalid params' do 
        post(:create, params: invalid_params)
        expect(response).to render_template(:new)
      end
    end
  end
end
