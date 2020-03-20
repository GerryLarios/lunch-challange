require 'rails_helper'
RSpec.describe SelectionsController, type: :controller do
  
  let(:admin) { create(:user, admin: true) }

  let(:list_meals) { create_list(:meal, 6) }

  before(:each) do
    login admin
  end

  describe 'GET #index' do
    it 'populates an array of selections' do
      selection = create(:selection, user: admin)
      get(:index)
      expect(assigns(:selections)).to eq([selection])
    end

    it 'renders the :index view' do
      get(:index)
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_params) do
        {
          selection: {
            month: 'april',
            meals: ['', list_meals.first.id]
          }
        }
      end

      it 'saves the selection in the database' do
        expect{ post(:create, params: valid_params) }.to change(Selection, :count).by(1)
      end

      it 'redirects to the selections page' do
        post(:create, params: valid_params)
        expect(response).to redirect_to(selections_path)
      end
    end
    
    context 'with invalid attributes' do
      let(:invalid_params) do
        { 
          selection: {
            month: nil,
            meals: ['']
          }
        }
      end

      it 'does not save the selections in the database' do
        expect{ post(:create, params: invalid_params) }.to_not change(Selection, :count)
      end

      it 'renders the :new template with invalid params' do 
        post(:create, params: invalid_params)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do

    let(:selection) do
      Selection.create(month: 'december', user: admin, meals: [list_meals.first])
    end

    context 'valid attributes' do
      it 'does located the requested selections' do
        meals = ['', list_meals.first.id, list_meals.last.id]
        put(:update, params: { id: selection.id, selection: { meals: meals }})
        expect(assigns(:selection).id).to eq(selection.id)
      end

      it 'does change @selection attributes' do
        meals = ['', list_meals.first.id, list_meals.last.id]
        put(:update, params: { id: selection.id, selection: { meals: meals }})
        expect(assigns(:selection).meals).to eq([list_meals.first, list_meals.last])
      end

      it 'redirects to selections path' do
        meals = ['', list_meals.first.id, list_meals.last.id]
        put(:update, params: { id: selection.id, selection: { meals: meals }})
        expect(response).to redirect_to(selections_path)
      end
    end

    context 'invalid attributes' do
      
      let(:selection) do
        Selection.create(month: 'september', meals: [list_meals.first], user: admin)
      end

      it 'renders :edit template' do
        put(:update, params: { id: selection.id, selection: { meals: [''] }})
        expect(response).to render_template(:edit)
      end
    end
  end
end
