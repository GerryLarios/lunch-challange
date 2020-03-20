require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  let(:admin) { create(:user, admin: true) }
  let(:user) { create(:user) }
  describe 'GET #index' do
   
    before(:each) { login(user) }
    
    it 'populates an array of meals' do
      meal = create(:meal, user: admin)
      get(:index)
      expect(assigns(:meals)).to eq([meal])
    end

    it 'renders the :index view' do
      get(:index)
      expect(response).to render_template(:index)
    end
  end
  
  describe 'POST #create' do
    context 'admin' do
      let(:meal_params) do
        { 
          meal: { 
            name: 'tacos', 
            img: Rack::Test::UploadedFile.new(Rails.root.join('food.png')) 
          }
        }
      end

      before(:each) do
        login admin
      end

      it 'can saves the new meal in the database' do
        expect{ post(:create, params: meal_params) }.to change(Meal, :count).by(1)
      end
      
      it 'redirect to the meals page' do
        post(:create, params: meal_params)
        expect(response).to redirect_to(meals_path)
      end
    end
    
    context 'meal with invalid attributes' do
      before(:each) do
        login admin
      end

      let(:meal_params) do
        { 
          meal: { 
            name: nil,
            img: Rack::Test::UploadedFile.new(Rails.root.join('food.png'))
          } 
        }
      end

      it 'does not save in the database' do
        expect{ post(:create, params: meal_params) }.to_not change(Meal, :count)
      end

      it 'renders the :new template' do
        post(:create, params: meal_params)
        expect(response).to render_template(:new) 
      end
    end

    context 'common user' do
      before(:each) do
        login user
      end

      let(:meal_params) do
        {
          meal: { 
            name: 'tacos', 
            img: Rack::Test::UploadedFile.new(Rails.root.join('food.png')) 
          }
        }
      end

      it 'can not save the meal in the database' do
        expect{ post(:create, params: meal_params) }.to_not change(Meal, :count)
      end

      it 'render the :index template' do
        post(:create, params: meal_params)
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'PUT #update' do
    context 'admin' do
      before(:each) { login admin }
      let(:admin_meal) { create(:meal, user: admin) }
      
      it 'does located the requested admin' do
        put(:update, params: { id: admin_meal.id, meal: { name: 'Costillas' } })
        expect(assigns(:meal).id).to eq(admin_meal.id)
      end

      it 'does change @meal attributes' do
        put(:update, params: { id: admin_meal.id, meal: { name: 'Costillas' } })
        expect(assigns(:meal).name).to eq('Costillas')
      end

      it 'redirects to meals path' do
        put(:update, params: { id: admin_meal.id, meal: { name: 'Costillas' } })
        expect(response).to redirect_to(meals_path)
      end

      it 'can not edit meals created by others' do
        meal = create(:meal)
        put(:update, params: { id: meal.id, meal: { name: 'Sopitos' } })
        expect(response).to render_template(:index)
      end
    end

    context 'common' do
      before(:each) do
        login user
      end

      it 'can not edit meals' do
        meal = create(:meal, user: admin)
        put(:update, params: { id: meal.id, meal: { name: 'Sopes gordos' } })
        expect(response).to render_template(:index)
      end
    end
  end
end
